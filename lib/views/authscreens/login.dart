import 'package:chat_buddy/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final Widget child;
  const LoginPage({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Login",
            style: TextStyle(color: AppColors.textColor),
          )
        ],
      ),
    );
  }
}
