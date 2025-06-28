import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../response/api_response_handler.dart';
import '../core/api_logger.dart';
import '../core/api_headers.dart';

class ApiRequestHelper {
  static Duration timeout = const Duration(seconds: 30);

  static Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    final mergedHeaders = ApiHeaders.merge(headers);
    ApiLogger.logRequest('GET', url, headers: mergedHeaders);
    final response = await http.get(Uri.parse(url), headers: mergedHeaders).timeout(timeout);
    ApiLogger.logResponse(response);
    return ApiResponseHandler.handle(response);
  }

  static Future<dynamic> post(String url, dynamic body, {Map<String, String>? headers}) async {
    final mergedHeaders = ApiHeaders.merge(headers);
    ApiLogger.logRequest('POST', url, headers: mergedHeaders, body: body);
    final response = await http.post(Uri.parse(url), headers: mergedHeaders, body: json.encode(body)).timeout(timeout);
    ApiLogger.logResponse(response);
    return ApiResponseHandler.handle(response);
  }

  static Future<dynamic> put(String url, dynamic body, {Map<String, String>? headers}) async {
    final mergedHeaders = ApiHeaders.merge(headers);
    ApiLogger.logRequest('PUT', url, headers: mergedHeaders, body: body);
    final response = await http.put(Uri.parse(url), headers: mergedHeaders, body: json.encode(body)).timeout(timeout);
    ApiLogger.logResponse(response);
    return ApiResponseHandler.handle(response);
  }

  static Future<dynamic> delete(String url, {Map<String, String>? headers}) async {
    final mergedHeaders = ApiHeaders.merge(headers);
    ApiLogger.logRequest('DELETE', url, headers: mergedHeaders);
    final response = await http.delete(Uri.parse(url), headers: mergedHeaders).timeout(timeout);
    ApiLogger.logResponse(response);
    return ApiResponseHandler.handle(response);
  }

  static Future<dynamic> multipartUpload(String url, File file, {Map<String, String>? headers, String fileKey = 'file'}) async {
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
