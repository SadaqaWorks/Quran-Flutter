import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_startup_state.freezed.dart';

@freezed
abstract class AppStartupState with _$AppStartupState {
  const factory AppStartupState.initializing() = _Initializing;
  const factory AppStartupState.needsAuth() = _NeedsAuth;
  const factory AppStartupState.needsToDownloadFile() = _NeedsToDownloadFile;
  const factory AppStartupState.loadHome() = _LoadHome;
}
