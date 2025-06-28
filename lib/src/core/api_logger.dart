import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiLogger {
  static void logRequest(String method, String url, {Map<String, String>? headers, dynamic body}) {
    print('--- API Request [$method] ---');
    print('URL: $url');
    if (headers != null) print('Headers: $headers');
    if (body != null) print('Body: ${json.encode(body)}');
  }

  static void logResponse(http.Response response) {
    print('--- API Response ---');
    print('Status: ${response.statusCode}');
    print('Body: ${response.body}');
  }
}
