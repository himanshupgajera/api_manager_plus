import 'package:connectivity_plus/connectivity_plus.dart';

class SafeApiCall {
  static Future<T> call<T>(Future<T> Function() apiFunction) async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) {
      throw 'No Internet connection. Please check your connection and try again.';
    }

    try {
      return await apiFunction();
    } catch (e) {
      throw 'Unexpected error: $e';
    }
  }
}
