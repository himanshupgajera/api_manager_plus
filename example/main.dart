import 'package:api_manager_plus/api_manager_plus.dart';

void main() async {
  try {
    final getData = await SafeApiCall.call(
      () => ApiRequestHelper.get('https://httpbin.org/get'),
    );
    print('GET Response: \n$getData');

    final postData = await SafeApiCall.call(
      () => ApiRequestHelper.post('https://httpbin.org/post', {'key': 'value'}),
    );
    print('POST Response: \n$postData');

    final putData = await SafeApiCall.call(
      () => ApiRequestHelper.put('https://httpbin.org/put', {'key': 'updated'}),
    );
    print('PUT Response: \n$putData');

    final deleteData = await SafeApiCall.call(
      () => ApiRequestHelper.delete('https://httpbin.org/delete'),
    );
    print('DELETE Response: \n$deleteData');

    // Replace this with an actual file path to test multipart
    // final file = File('path/to/file.png');
    // final uploadData = await SafeApiCall.call(() =>
    //   ApiRequestHelper.multipartUpload('https://httpbin.org/post', file));
    // print('Multipart Response: \n$uploadData');
  } catch (e) {
    print('Error: $e');
  }
}
