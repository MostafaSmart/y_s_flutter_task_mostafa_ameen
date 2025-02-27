import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> get onConnectionChanged;
}

class NetworkInfoImpl implements NetworkInfo {




  final InternetConnectionChecker _internetConnectionChecker = InternetConnectionChecker();

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;

  @override
  Stream<bool> get onConnectionChanged {
    return _internetConnectionChecker.onStatusChange.map((status) {
      return status == InternetConnectionStatus.connected;
    });
  }



  
}