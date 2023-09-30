import 'package:get/get.dart';
import 'package:chat_buddy/helper/auth_helper.dart';
import 'package:chat_buddy/mock/user_data.dart';
import 'package:chat_buddy/model/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> _user = UserModel(
    username: 'ehi-j',
    email: 'kadiriworkspace@gmail.com',
    password: 'topsecretpassword',
  ).obs;
  String accessToken = '';

  get username => _user.value.username;
  get email => _user.value.email;
  get subscriptionStatus => _user.value.checkSubscriptionState();
  get subscriptionLeft => _user.value.checkSubscriptionDaysLeft();

  get subscriptionType =>
      _user.value.accountCreationTime.difference(DateTime.now()).inDays > 30
          ? 'Paid Account'
          : 'Free Account';

  AuthHelper authHelper = AuthHelper();

  updateLastSubscription() {
    _user.value.updateLastSubscription();
  }

  updateUser({
    required String username,
    required String email,
  }) async {
    _user.update((val) {
      val?.username = username;
      val?.email = email;
    });
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
    _user.value = UserModel.fromMap(userData['user4']);
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
    _user.value = UserModel.fromMap(userData['user4']);
  }

  changePassword({required String password}) {
    _user.value.password = password;
  }

  logoutUser() async {
    userData.clear();
    accessToken = '';
  }
}
