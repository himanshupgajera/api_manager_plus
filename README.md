# api_manager_plus

`api_manager_plus` is a powerful, platform-independent Dart package for safe and flexible API integration with:

- ✅ Internet connectivity check
- ✅ Standard GET, POST, PUT, DELETE requests
- ✅ Multipart file upload support
- ✅ Centralized error/response handling
- ✅ Configurable headers and console logging
- ✅ Works across Android, iOS, Web, and Desktop

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  api_manager_plus: ^1.0.0
```

## 🚀 Usage

```dart
import 'package:api_manager_plus/api_manager_plus.dart';

void main() async {
  final response = await SafeApiCall.call(() => ApiRequestHelper.get('https://httpbin.org/get'));
  print(response);
}
```

For full examples, see `example/main.dart`.

## 📄 License

BSD-3-Clause
