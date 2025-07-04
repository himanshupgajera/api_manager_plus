/// The main entry point for the `api_manager_plus` package.
///
/// This package provides a structured and reusable approach to
/// API integration in Flutter and Dart applications, including:
///
/// - Safe API calling with connectivity checks
/// - Request and response logging
/// - Unified header management
/// - Error handling
/// - Support for standard and multipart requests
///
/// ## Usage:
/// ```dart
/// import 'package:api_manager_plus/api_manager_plus.dart';
///
/// final response = await ApiManagerPlusBase.get('https://api.example.com/data');
/// ```
///
/// See the README for detailed usage instructions.
library api_manager_plus;

export 'src/core/api_headers.dart';
export 'src/core/api_logger.dart';
export 'src/core/safe_api_call.dart';
export 'src/request/api_request_helper.dart';
export 'src/response/api_response_handler.dart';
