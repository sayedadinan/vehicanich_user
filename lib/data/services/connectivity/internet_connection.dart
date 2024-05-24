// class ConnectivityService {
//   final Connectivity _connectivity = Connectivity();
//   Stream<List<ConnectivityResult>> get connectivityStream =>
//       _connectivity.onConnectivityChanged;
// }

import 'package:connectivity_plus/connectivity_plus.dart';

Stream<bool> checkInternetConnection() async* {
  final connectivity = await Connectivity().checkConnectivity();
  if (connectivity.contains(ConnectivityResult.none)) {
    yield false;
  } else {
    yield true;
  }
  await for (var currnt in Connectivity().onConnectivityChanged) {
    if (currnt.contains(ConnectivityResult.none)) {
      yield false;
    } else {
      yield true;
    }
  }
}
