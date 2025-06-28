import 'package:test/test.dart';
import 'package:api_manager_plus/api_manager_plus.dart';

void main() {
  group('ApiHeaders', () {
    test('should merge default and custom headers correctly', () {
      final merged = ApiHeaders.merge({'Authorization': 'Bearer token'});
      expect(merged['Content-Type'], 'application/json');
      expect(merged['Accept'], 'application/json');
      expect(merged['Authorization'], 'Bearer token');
    });
  });

  group('SafeApiCall', () {
    test('should throw error when no internet (mocked)', () async {
      // This is a placeholder; actual connectivity mocking requires integration test setup.
      expect(() async {
        await SafeApiCall.call(() async => throw 'No Internet');
      }, throwsA(isA<String>()));
    });
  });
}
