import 'package:intl/intl.dart';

class UserModel {
  UserModel({
    required this.username,
    required this.email,
    required this.password,
  });
  String email;
  String username;
  String password;
  DateTime _lastSubscription = DateTime.now();
  DateTime _accountCreationTime = DateTime.now();

  DateTime get accountCreationTime => _accountCreationTime;

  get lastSubscription => DateFormat.yMMMMEEEEd().format(_lastSubscription);

  void updateLastSubscription() {
    _lastSubscription = DateTime.now();
  }

  bool checkSubscriptionState() {
    if (_lastSubscription.difference(DateTime.now()) >
        const Duration(days: 30)) {
      return false;
    }
    return true;
  }

  int checkSubscriptionDaysLeft() {
    if (_lastSubscription.difference(DateTime.now()) <=
        const Duration(days: 30)) {
      return _lastSubscription.difference(DateTime.now()).inDays + 30;
    }
    return 0;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      email: map['email'],
      password: map['password'],
    );
  }
}
