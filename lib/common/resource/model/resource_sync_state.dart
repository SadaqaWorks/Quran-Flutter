import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quran_reader/common/resource/model/resource.dart';

part 'resource_sync_state.freezed.dart';

@freezed
class ResourceSyncState with _$ResourceSyncState {
  const factory ResourceSyncState.synced(Resource resource) = _Synced;

  const factory ResourceSyncState.syncing(Resource resource) = _Syncing;

  const factory ResourceSyncState.internetUnAvailable(Resource resource) =
      _InternetUnAvailable;

  const factory ResourceSyncState.failed(Resource resource) = _failed;
}
