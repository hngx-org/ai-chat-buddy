import 'package:get/get.dart';
import 'package:chat_buddy/helper/auth_helper.dart';
import 'package:chat_buddy/mock/user_data.dart';
import 'package:chat_buddy/model/user_model.dart';

class UserController extends GetxController {
  late UserModel _user = UserModel(
    username: 'ehi-j',
    email: 'kadiriworkspace@gmail.com',
    password: 'topsecretpassword',
  );
  String accessToken = '';

  get username => _user.username;
  get email => _user.email;
  get subscriptionStatus => _user.checkSubscriptionState();
  get subscriptionLeft => _user.checkSubscriptionDaysLeft();
  

  AuthHelper authHelper = AuthHelper();

  updateLastSubscription() {
    _user.updateLastSubscription();
  }

  loginUser({
    required String username,
    required String email,
    required String password,
  }) async {
    // user = UserModel(
    //   username: email,
    //   password: password,
    // );
    userData['user4'] = {
      'username': username,
      'email': email,
      'password': password,
    };
    _user = UserModel.fromMap(userData['user4']);
  }

  registerUser(
      {required String username,
      required String email,
      required String password}) async {
    userData['user4'] = {
      'username': username,
      'email': email,
      'password': password,
    };
    _user = UserModel.fromMap(userData['user4']);
  }

  changePassword({required String password}) {
    _user.password = password;
  }

  logoutUser() async {
    userData.clear();
    accessToken = '';
  }
}
