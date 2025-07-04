import 'package:connectivity_plus/connectivity_plus.dart';

/// A utility class that wraps API calls with internet connectivity checks
/// and exception handling.
///
/// This ensures:
/// - The device has an active internet connection before executing the API call.
/// - Errors are caught and returned as descriptive messages.
///
/// ## Example usage:
/// ```dart
/// final result = await SafeApiCall.call(() => yourApiMethod());
/// ```
class SafeApiCall {
  /// Safely executes an asynchronous [apiFunction] after checking internet connectivity.
  ///
  /// - Checks if the device is connected to the internet via mobile data, Wi-Fi,
  ///   Ethernet, or VPN using [connectivity_plus].
  /// - Executes the [apiFunction] only if internet is available.
  /// - Catches and rethrows exceptions with a generic error message.
  ///
  /// Returns a `Future<T>` containing the result of the API call.
  /// Throws a [String] error message if:
  /// - There is no internet connection.
  /// - The function throws an unexpected error.
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
