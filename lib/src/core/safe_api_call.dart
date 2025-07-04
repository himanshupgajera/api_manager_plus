import 'package:connectivity_plus/connectivity_plus.dart';

class SafeApiCall {
  static Future<T> call<T>(Future<T> Function() apiFunction) async {
    final List<ConnectivityResult> connectivity =
        await Connectivity().checkConnectivity();

    final bool hasInternet = connectivity.contains(ConnectivityResult.mobile) ||
        connectivity.contains(ConnectivityResult.wifi) ||
        connectivity.contains(ConnectivityResult.ethernet) ||
        connectivity.contains(ConnectivityResult.vpn);

    if (!hasInternet) {
      throw 'No internet connection. Please check your connection and try again.';
    }

    try {
      return await apiFunction();
    } catch (e) {
      throw 'Unexpected error: $e';
    }
  }
}
