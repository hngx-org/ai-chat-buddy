import 'package:chat_buddy/constants/db_constants.dart';
import 'package:chat_buddy/database/local_db.dart';
import 'package:get/get.dart';
import 'package:chat_buddy/helper/auth_helper.dart';
import 'package:chat_buddy/mock/user_data.dart';
import 'package:chat_buddy/model/user_model.dart';
import 'package:hng_authentication/authentication.dart';

class UserController extends GetxController {
  final localDb = OfflineDatabase(dbName: userdb);
  late Rx<UserModel> _user;

  String accessToken = '';

  get username => _user.value.username;
  get email => _user.value.email;
  get subscriptionStatus => _user.value.checkSubscriptionState();
  get subscriptionLeft => _user.value.checkSubscriptionDaysLeft();

  get subscriptionType =>
      _user.value.accountCreationTime.difference(DateTime.now()).inDays > 30
          ? 'Paid Account'
          : 'Free Account';

  final authRepository = Authentication();

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
    required String email,
    required String password,
  }) async {
    dynamic result;
    try {
      result = await authRepository.signIn(email, password);
    } catch (_) {
      return 'login error';
    }
    if (result != null) {
      // final data = json.decode(result.body);
      _user = UserModel(
        username: result.name,
        email: result.email,
        password: password,
      ).obs;
      await storeUser();
      return null;
    } else {
      return 'login error';
    }
  }

  signupUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await authRepository.signUp(email, name, password);
    // dynamic result;
    // try {
    //   result = await authRepository.signIn(email, password);
    // } catch (_) {
    //   return 'Signup error';
    // }
    if (result != null) {
      // final data = json.decode(result.body);
      _user = UserModel(
        username: result.name,
        email: result.email,
        password: password,
      ).obs;
      await storeUser();
      return null;
    } else {
      return 'sign up error';
    }
  }

  changePassword({required String password}) {
    _user.value.password = password;
  }

  logoutUser() async {
    userData.clear();
    await authRepository.logout(email);
  }

  Future<void> storeUser() async {
    await localDb.addData<UserModel>(_user.value);
  }

  Future<void> retrieveUser() async {
    final user = await localDb.retrieveData<UserModel>();
    for (int i = 0; i < user.length; i++) {
      print(user[i]);
    }
  }
}
