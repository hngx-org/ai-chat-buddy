import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static Color primaryColor = const Color.fromARGB(255, 18, 28, 136);
  static Color secondaryColor = const Color.fromARGB(255, 83, 31, 117);
  static Color tertiaryColor = const Color.fromARGB(255, 87, 61, 167);
  static Color purple = const Color.fromARGB(255, 84, 0, 201);
  static Color textColor = const Color.fromARGB(255, 248, 248, 248);
  static Color receiverChatBubble = const Color.fromARGB(255, 26, 121, 216);
  static Color white = const Color(0xFFFFFFFF);
  static Color senderChatBubble = const Color.fromARGB(255, 1, 133, 119);
  static Color errorColor = const Color.fromARGB(255, 216, 51, 49);

  static const gradient1 = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color.fromARGB(255, 83, 31, 117),
      Color.fromARGB(255, 18, 28, 136),
    ],
  );
}
//const Color(0xFF0D47A1);
//Color(0xFF3949AB);