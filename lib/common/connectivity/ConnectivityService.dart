import 'package:connectivity/connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = Provider<ConnectivityServiceNotifier>((ref) {
  return ConnectivityServiceNotifier();
});

final connectivityCheckProvider = Provider<ConnectivityCheck>((ref) {
  return ConnectivityCheck();
});

class ConnectivityServiceNotifier extends StateNotifier<ConnectivityStatus> {
  // // Create our public controller
  // StreamController<ConnectivityStatus> connectionStatusController =
  //     StreamController<ConnectivityStatus>();

  ConnectivityServiceNotifier() : super(ConnectivityStatus.Offline) {
    // Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      state = _getStatusFromResult(result);
      //connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  // Convert from the third part enum to our own enum
  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Online;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.Online;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}

enum ConnectivityStatus { Online, Offline }

class ConnectivityCheck {
  Future<ConnectivityStatus> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return ConnectivityStatus.Online;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return ConnectivityStatus.Online;
    } else {
      return ConnectivityStatus.Offline;
    }
  }
}
