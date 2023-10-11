

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;
  // DataConnectionChecker _dataConnectionChecker;

  NetworkInfoImpl(this._connectivity);

  @override
  Future<bool> get isConnected async{
    final connectivityResult = await _connectivity.checkConnectivity();
    // _connectivity.onConnectivityChanged.listen((event) { })
    if( connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi ||connectivityResult == ConnectivityResult.ethernet) {
      return true;
    } else {
      return false;
    }
  }
}