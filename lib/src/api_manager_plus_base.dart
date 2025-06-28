import 'package:api_manager_plus/api_manager_plus.dart';

class ApiManagerPlusBase {
  /// Example method to perform a safe GET request
  static Future<dynamic> get(String url, {Map<String, String>? headers}) {
    return SafeApiCall.call(() => ApiRequestHelper.get(url, headers: headers));
  }

  /// Example method to perform a safe POST request
  static Future<dynamic> post(
    String url,
    dynamic body, {
    Map<String, String>? headers,
  }) {
    return SafeApiCall.call(
      () => ApiRequestHelper.post(url, body, headers: headers),
    );
  }

  /// Example method to perform a safe PUT request
  static Future<dynamic> put(
    String url,
    dynamic body, {
    Map<String, String>? headers,
  }) {
    return SafeApiCall.call(
      () => ApiRequestHelper.put(url, body, headers: headers),
    );
  }

  /// Example method to perform a safe DELETE request
  static Future<dynamic> delete(String url, {Map<String, String>? headers}) {
    return SafeApiCall.call(
      () => ApiRequestHelper.delete(url, headers: headers),
    );
  }
}
