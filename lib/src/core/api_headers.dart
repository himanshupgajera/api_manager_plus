/// A utility class to manage and merge HTTP headers for API requests.
///
/// This class provides a default set of headers (e.g., `Content-Type`,
/// `Accept`) and allows merging with custom headers.
class ApiHeaders {
  /// Default headers applied to every API request.
  ///
  /// Includes:
  /// - `'Content-Type': 'application/json'`
  /// - `'Accept': 'application/json'`
  static Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  /// Merges [customHeaders] with [defaultHeaders].
  ///
  /// Custom headers take precedence if keys overlap.
  ///
  /// Returns a new `Map<String, String>` with combined headers.
  ///
  /// ## Example:
  /// ```dart
  /// final headers = ApiHeaders.merge({
  ///   'Authorization': 'Bearer your_token',
  /// });
  /// ```
  static Map<String, String> merge(Map<String, String>? customHeaders) {
    return {...defaultHeaders, if (customHeaders != null) ...customHeaders};
  }
}
