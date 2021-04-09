import 'dart:io' as io;

import 'package:hive/hive.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:quran_reader/common/http/api_provider.dart';
import 'package:quran_reader/common/resource/manager/database_manager.dart';
import 'package:quran_reader/common/resource/model/resource.dart';
import 'package:quran_reader/common/resource/model/resource_sync_state.dart';

class ResourceSyncRepository {
  final APIProvider apiProvider;
  late Box _resourcesBox;

  ResourceSyncRepository(this.apiProvider) {
    _resourcesBox = Hive.box(Databases.resources);
  }

  Future<ResourceSyncState> sync(Resource resource) async {
    switch (resource.fileType) {
      case FileType.json:
        {}
        break;

      case FileType.db:
        {
          final response = await _syncDB(resource);
          if (response) {
            _syncResourcesBox(resource);
            ResourceSyncState.synced(resource);
          } else {
            ResourceSyncState.failed(resource);
          }
        }
        break;

      case FileType.imageZip:
        {
          //statements;
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }

    return ResourceSyncState.failed(resource);
  }

  void _syncResourcesBox(Resource resource) {
    List<Resource>? _resources =
        _resourcesBox.get(ResourcesConstants.resources.toString());
    if (_resources != null) {
      final index =
          _resources.indexWhere((element) => element.id == resource.id);
      _resources[index] =
          resource.copyWith(downloaded: true, needRefresh: false);
      _resourcesBox.put(ResourcesConstants.resources.toString(), _resources);
    }
  }

  Future<bool> _syncJson(Resource resource) async {
    return false;
  }

  Future<bool> _syncDB(Resource resource) async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String dbPath = path.join(
        documentDirectory.path + resource.resourceType.toString(),
        resource.name);
    bool dbExists = await io.File(dbPath).exists();

    if (dbExists) {
      await io.File(dbPath).delete();
    }
    return await apiProvider.downloadFile(resource.url, dbPath);
  }
}
