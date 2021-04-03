import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:quran_reader/common/http/api_provider.dart';
import 'package:quran_reader/common/resource/hive/hive_manager.dart';
import 'package:quran_reader/common/resource/manager/resources_state.dart';
import 'package:quran_reader/common/resource/model/resource.dart';
import 'package:quran_reader/common/resource/model/resources.dart';

final resourcesProvider = FutureProvider<ResourcesState>((ref) async {
  return ResourceManager(ref.watch(apiProvider)).check();
});

class ResourceManager {
  static const RESOURCES = 'resources';
  static const RESOURCES_NEED_REFRESH = 'resources_need_refresh';

  //final SharedPreferences sharedPreferences;
  final APIProvider apiProvider;
  ResourceManager(this.apiProvider);

  Future<ResourcesState> check() async {
    var box = Hive.box(HiveBoxes.resources);
    Resources? resources = box.get(RESOURCES);

    print('ResourceManager ${resources?.list.length}');
    // Previous data isn't available so fetch list from API
    if (resources == null) {
      //CALL API if internet is available
      final response = await apiProvider
          .get('https://api.jsonbin.io/b/606836c69fc4de52061cd548');
      if (response != null) {
        List<Resource> list = List<Resource>.from(
            response['data'].map((x) => Resource.fromJson(x)));
        Resources resources = Resources(storedTime: DateTime.now(), list: list);
        box.put(RESOURCES, resources);

        return Future.value(ResourcesState.needsToDownload());
      }
      // Couldn't fetch from API
      return Future.value(ResourcesState.unAvailable());
    } else {
      // need to fresh, update this via silent notification or something
      final resourcesNeedRefresh =
          box.get(RESOURCES_NEED_REFRESH, defaultValue: false);

      final difference = DateTime.now().difference(resources.storedTime).inDays;

      //if previously fetched is more than 3 days then call an API and update
      if (difference >= 3 || resourcesNeedRefresh) {
        final response = await apiProvider.get("url");
        if (response != null) {
          List<Resource> list = List<Resource>.from(
              response['data'].map((x) => Resource.fromJson(x)));

          List<Resource> iteratedList = List.empty();
          for (var newItem in list) {
            Resource oldItem = resources.list.firstWhere(
                (element) => element.id == newItem.id,
                orElse: () => newItem);

            bool needRefresh = oldItem.needRefresh;
            bool downloaded = oldItem.downloaded;
            //if new items version is higher than old version then it needs to refresh
            if (newItem.version > oldItem.version) {
              needRefresh = true;
              if (newItem.required && needRefresh) {
                //if need refresh and required then set is downloaded and let download again
                downloaded = false;
              }
            }

            final item = newItem.copyWith(
                needRefresh: needRefresh, downloaded: downloaded);
            print("RESOURCE downloaded ${item.downloaded}");
            iteratedList.add(item);
          }

          Resources newResources =
              Resources(storedTime: DateTime.now(), list: iteratedList);

          box.put(RESOURCES_NEED_REFRESH, false);
          box.put(RESOURCES, newResources);

          final loaded = iteratedList
              .where((i) => i.required && !i.downloaded)
              .toList()
              .isEmpty;

          print("RESOURCE loaded ${loaded}");
          //if required and not downloaded send to download page
          if (loaded) {
            return Future.value(ResourcesState.available(newResources.list));
          } else {
            return Future.value(ResourcesState.needsToDownload());
          }
        }
      }
      //if required and not downloaded send to download page
      if (resources.list
          .where((i) => i.required && !i.downloaded)
          .toList()
          .isEmpty) {
        return Future.value(ResourcesState.available(resources.list));
      } else {
        return Future.value(ResourcesState.needsToDownload());
      }
    }
  }
}
