import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  UserModel({
    required this.username,
    required this.email,
    required this.password,
  });
  @HiveField(0)
  String email;
  @HiveField(1)
  String username;
  @HiveField(2)
  String password;
  @HiveField(3)
  DateTime _lastSubscription = DateTime.now();
  @HiveField(4)
  DateTime _accountCreationTime = DateTime.now();
  @HiveField(5)
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
