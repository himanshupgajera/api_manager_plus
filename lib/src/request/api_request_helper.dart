import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../response/api_response_handler.dart';
import '../core/api_logger.dart';
import '../core/api_headers.dart';

/// A helper class for executing HTTP requests with standardized logging,
/// headers merging, timeout control, and error handling.
///
/// This class is used internally by `ApiManagerPlusBase` to perform
/// all API requests in a consistent and safe manner.
///
/// ## Features:
/// - Supports `GET`, `POST`, `PUT`, `DELETE`, and `Multipart Upload`
/// - Logs requests and responses via [ApiLogger]
/// - Merges default and custom headers using [ApiHeaders]
/// - Handles timeouts and response errors via [ApiResponseHandler]
class ApiRequestHelper {
  /// Timeout duration for all requests (default: 30 seconds)
  static Duration timeout = const Duration(seconds: 30);

  /// Sends a GET request to the given [url] with optional [headers].
  ///
  /// Returns the decoded response or throws an error on failure.
  static Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    final mergedHeaders = ApiHeaders.merge(headers);
    ApiLogger.logRequest('GET', url, headers: mergedHeaders);
    final response =
        await http.get(Uri.parse(url), headers: mergedHeaders).timeout(timeout);
    ApiLogger.logResponse(response);
    return ApiResponseHandler.handle(response);
  }

  /// Sends a POST request to the given [url] with a [body] and optional [headers].
  ///
  /// The [body] is JSON-encoded before sending.
  ///
  /// Returns the decoded response or throws an error on failure.
  static Future<dynamic> post(String url, dynamic body,
      {Map<String, String>? headers}) async {
    final mergedHeaders = ApiHeaders.merge(headers);
    ApiLogger.logRequest('POST', url, headers: mergedHeaders, body: body);
    final response = await http
        .post(Uri.parse(url), headers: mergedHeaders, body: json.encode(body))
        .timeout(timeout);
    ApiLogger.logResponse(response);
    return ApiResponseHandler.handle(response);
  }

  /// Sends a PUT request to the given [url] with a [body] and optional [headers].
  ///
  /// The [body] is JSON-encoded before sending.
  ///
  /// Returns the decoded response or throws an error on failure.
  static Future<dynamic> put(String url, dynamic body,
      {Map<String, String>? headers}) async {
    final mergedHeaders = ApiHeaders.merge(headers);
    ApiLogger.logRequest('PUT', url, headers: mergedHeaders, body: body);
    final response = await http
        .put(Uri.parse(url), headers: mergedHeaders, body: json.encode(body))
        .timeout(timeout);
    ApiLogger.logResponse(response);
    return ApiResponseHandler.handle(response);
  }

  /// Sends a DELETE request to the given [url] with optional [headers].
  ///
  /// Returns the decoded response or throws an error on failure.
  static Future<dynamic> delete(String url,
      {Map<String, String>? headers}) async {
    final mergedHeaders = ApiHeaders.merge(headers);
    ApiLogger.logRequest('DELETE', url, headers: mergedHeaders);
    final response = await http
        .delete(Uri.parse(url), headers: mergedHeaders)
        .timeout(timeout);
    ApiLogger.logResponse(response);
    return ApiResponseHandler.handle(response);
  }

  /// Uploads a file using a multipart/form-data POST request to the given [url].
  ///
  /// - [file]: The file to upload.
  /// - [headers]: Optional headers to include.
  /// - [fileKey]: The field name for the file in the multipart body (default: 'file').
  ///
  /// Returns the decoded response or throws an error on failure.
  static Future<dynamic> multipartUpload(
    String url,
    File file, {
    Map<String, String>? headers,
    String fileKey = 'file',
  }) async {
    final mergedHeaders = ApiHeaders.merge(headers);
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(mergedHeaders);
    request.files.add(await http.MultipartFile.fromPath(fileKey, file.path));

    ApiLogger.logRequest('POST (multipart)', url, headers: mergedHeaders);
    final streamedResponse = await request.send().timeout(timeout);
    final response = await http.Response.fromStream(streamedResponse);
    ApiLogger.logResponse(response);
    return ApiResponseHandler.handle(response);
  }
}
