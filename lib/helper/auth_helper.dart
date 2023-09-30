import 'package:chat_buddy/helper/auth_status.dart';

class AuthHelper {
  Future<Map<AuthStatus, dynamic>> loginUser({
    required String username,
    required String password,
  }) async {
    print('Hello World');
    return {
      AuthStatus.success: 'prosper',
    };
  }

  Future<Map<AuthStatus, dynamic>> signUpUser({
    required String username,
    required String password,
  }) async {
    print('Hello World');
    return {
      AuthStatus.success: 'prosper',
    };
  }

  Future<Map<AuthStatus, dynamic>> logout() async {
    print('Hello World');
    return {
      AuthStatus.success: 'prosper',
    };
  }
}
