import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quran_reader/common/resource/model/resource.dart';

part 'resources_state.freezed.dart';

@freezed
class ResourcesState with _$ResourcesState {
  const factory ResourcesState.available(List<Resource> resources) = _Available;
  const factory ResourcesState.needsToDownload() = _NeedsToDownload;
  const factory ResourcesState.unAvailable() = _UnAvailable;
}
