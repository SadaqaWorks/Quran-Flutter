import 'dart:async';

/// Single tap debouncer
class DebouncerHandler {
  DebouncerHandler() : _busyController = StreamController<bool>() {
    _busyController.add(false);
  }

  final StreamController<bool> _busyController;

  /// Busy state stream
  Stream<bool> get busyStream => _busyController.stream;

  /// Dispose resources
  void dispose() {
    _busyController.close();
  }

  /// Process onTap
  /// returns true if tap is processed and false if skipped
  Future<void> onTap(Future<void> Function() onTap) async {
    try {
      if (!_busyController.isClosed) {
        _busyController.add(true);
      }

      await onTap();
    } on Exception catch (_) {
      rethrow;
    } finally {
      if (!_busyController.isClosed) {
        _busyController.add(false);
      }
    }
  }
}
