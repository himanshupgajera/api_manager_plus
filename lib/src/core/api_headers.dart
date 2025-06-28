class ApiHeaders {
  static Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Map<String, String> merge(Map<String, String>? customHeaders) {
    return {...defaultHeaders, if (customHeaders != null) ...customHeaders};
  }
}
