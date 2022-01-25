import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class LoginCall {
  static Future<ApiCallResponse> call({
    String identity = '',
    String password = '',
  }) {
    final body = '''
{
  "identity": "${identity}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'http://127.0.0.1:9092/api/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'identity': identity,
        'password': password,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
