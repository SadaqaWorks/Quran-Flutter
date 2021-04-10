import 'package:hive/hive.dart';
import 'package:quran_reader/common/http/api_provider.dart';
import 'package:quran_reader/common/resource/manager/database_manager.dart';
import 'package:quran_reader/common/resource/model/resource.dart';
import 'package:quran_reader/feature/app_start_up/model/resources_sync_state.dart';

class ResourcesSyncRepository {
  //final SharedPreferences sharedPreferences;
  final APIProvider apiProvider;

  ResourcesSyncRepository(this.apiProvider);

  Future<ResourcesSyncState> sync() async {
    var box = Hive.box(Databases.resources);
    final _list = box.get(ResourcesConstants.resources.toString());

    // Previous data isn't available so fetch list from API
    if (_list == null) {
      //CALL API if internet is available
      final response = await apiProvider
          .get('https://api.jsonbin.io/b/606836c69fc4de52061cd548');
      if (response != null) {
        List<Resource> resources = List<Resource>.from(
            response['data'].map((x) => Resource.fromJson(x)));
        box.put(ResourcesConstants.resources.toString(), resources);

        return ResourcesSyncState.needsToDownload();
      }
      // Couldn't fetch from API
      return ResourcesSyncState.unAvailable();
    } else {
      final resources = List<Resource>.from(_list);

      // need to fresh, update this via silent notification or something
      final resourcesNeedRefresh = box
          .get(ResourcesConstants.needRefresh.toString(), defaultValue: false);
      final DateTime syncedTime = box.get(
          ResourcesConstants.syncedTime.toString(),
          defaultValue: DateTime.now());

      final difference = DateTime.now().difference(syncedTime).inDays;

      //if previously fetched is more than 3 days then call an API and update
      if (difference >= 3 || resourcesNeedRefresh) {
        final response = await apiProvider.get("url");
        if (response != null) {
          List<Resource> list = List<Resource>.from(
              response['data'].map((x) => Resource.fromJson(x)));

          List<Resource> iteratedList = List.empty();
          for (var newItem in list) {
            Resource oldItem = resources.firstWhere(
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

          box.put(ResourcesConstants.syncedTime.toString(), DateTime.now());
          box.put(ResourcesConstants.needRefresh.toString(), false);
          box.put(ResourcesConstants.resources.toString(), iteratedList);

          final loaded = iteratedList
              .where((i) => i.required && !i.downloaded)
              .toList()
              .isEmpty;

          print("RESOURCE loaded ${loaded}");
          //if required and not downloaded send to download page
          if (loaded) {
            return ResourcesSyncState.available(iteratedList);
          } else {
            return ResourcesSyncState.needsToDownload();
          }
        }
      }
      //if required and not downloaded send to download page
      if (resources
          .where((i) => i.required && !i.downloaded)
          .toList()
          .isEmpty) {
        return ResourcesSyncState.available(resources);
      } else {
        return ResourcesSyncState.needsToDownload();
      }
    }
  }
}
