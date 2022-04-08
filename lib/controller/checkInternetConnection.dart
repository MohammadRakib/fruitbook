import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
class CheckInternetConnection{

  late bool _isConnectionSuccessful;

  //check initial connection
  Future<bool> checkInitialConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    return await checkConnectivityState(result);
  }

    // check if check if connection has internet
  Future<bool> _tryConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      _isConnectionSuccessful = response.isNotEmpty;

    } on SocketException catch (e) {
      print(e);
      _isConnectionSuccessful = false;
    }
    return _isConnectionSuccessful;
  }

  //check connectivity
  Future<bool> checkConnectivityState(ConnectivityResult? connectivityResult) async{

    if (connectivityResult == ConnectivityResult.wifi) {
      return await _tryConnection();
    } else if (connectivityResult == ConnectivityResult.mobile) {
      return await _tryConnection();
    } else {
      return false;
    }
  }
}
