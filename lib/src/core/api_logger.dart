import 'dart:convert';
import 'package:http/http.dart' as http;

/// A utility class for logging API requests and responses to the console.
///
/// Helps developers debug network requests by printing request method,
/// URL, headers, and body, along with response status and body.
///
/// **Note:** This logger prints to the console using `print()` and should
/// be disabled or replaced with a proper logger in production environments.
class ApiLogger {
  /// Logs an HTTP request.
  ///
  /// - [method]: The HTTP method (e.g., GET, POST, PUT, DELETE).
  /// - [url]: The endpoint URL.
  /// - [headers]: Optional headers sent with the request.
  /// - [body]: Optional body sent with the request, will be JSON-encoded.
  static void logRequest(
    String method,
    String url, {
    Map<String, String>? headers,
    dynamic body,
  }) {
    print('--- API Request [$method] ---');
    print('URL: $url');
    if (headers != null) print('Headers: $headers');
    if (body != null) print('Body: ${json.encode(body)}');
  }

  /// Logs an HTTP response.
  ///
  /// - [response]: The HTTP response received from the server.
  static void logResponse(http.Response response) {
    print('--- API Response ---');
    print('Status: ${response.statusCode}');
    print('Body: ${response.body}');
  }
}
