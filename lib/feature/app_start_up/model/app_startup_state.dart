import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_startup_state.freezed.dart';

@freezed
class AppStartupState with _$AppStartupState {
  const factory AppStartupState.initializing() = _Initializing;
  const factory AppStartupState.needsAuth() = _NeedsAuth;
  const factory AppStartupState.needsToDownload() = _NeedsToDownload;
  const factory AppStartupState.internetUnAvailable() = _InternetUnAvailable;
  const factory AppStartupState.loadHome() = _LoadHome;
}
