import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quran_reader/common/resource/model/resource.dart';

part 'resources_sync_state.freezed.dart';

@freezed
class ResourcesSyncState with _$ResourcesSyncState {
  const factory ResourcesSyncState.available(List<Resource> resources) =
      _Available;

  const factory ResourcesSyncState.needsToDownload() = _NeedsToDownload;

  const factory ResourcesSyncState.unAvailable() = _UnAvailable;
}
