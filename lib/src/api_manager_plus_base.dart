import 'package:api_manager_plus/api_manager_plus.dart';

/// A base class for making safe API requests using `api_manager_plus`.
///
/// This class provides static methods for handling common HTTP methods
/// (GET, POST, PUT, DELETE) with built-in error handling via `SafeApiCall`.
///
/// Usage:
/// ```dart
/// final response = await ApiManagerPlusBase.get('https://api.example.com/data');
/// if (response != null) {
///   // handle successful response
/// } else {
///   // handle error
/// }
/// ```
class ApiManagerPlusBase {
  /// Performs a safe HTTP GET request.
  ///
  /// [url] is the full endpoint URL.
  /// [headers] is an optional map of request headers.
  ///
  /// Returns a `Future<dynamic>` containing the response or `null` on error.
  static Future<dynamic> get(String url, {Map<String, String>? headers}) {
    return SafeApiCall.call(() => ApiRequestHelper.get(url, headers: headers));
  }

  /// Performs a safe HTTP POST request.
  ///
  /// [url] is the full endpoint URL.
  /// [body] is the request payload (JSON, FormData, etc.).
  /// [headers] is an optional map of request headers.
  ///
  /// Returns a `Future<dynamic>` containing the response or `null` on error.
  static Future<dynamic> post(
    String url,
    dynamic body, {
    Map<String, String>? headers,
  }) {
    return SafeApiCall.call(
      () => ApiRequestHelper.post(url, body, headers: headers),
    );
  }

  /// Performs a safe HTTP PUT request.
  ///
  /// [url] is the full endpoint URL.
  /// [body] is the request payload (JSON, FormData, etc.).
  /// [headers] is an optional map of request headers.
  ///
  /// Returns a `Future<dynamic>` containing the response or `null` on error.
  static Future<dynamic> put(
    String url,
    dynamic body, {
    Map<String, String>? headers,
  }) {
    return SafeApiCall.call(
      () => ApiRequestHelper.put(url, body, headers: headers),
    );
  }

  /// Performs a safe HTTP DELETE request.
  ///
  /// [url] is the full endpoint URL.
  /// [headers] is an optional map of request headers.
  ///
  /// Returns a `Future<dynamic>` containing the response or `null` on error.
  static Future<dynamic> delete(String url, {Map<String, String>? headers}) {
    return SafeApiCall.call(
      () => ApiRequestHelper.delete(url, headers: headers),
    );
  }
}
