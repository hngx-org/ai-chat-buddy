import 'package:chat_buddy/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.leadingIcon,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500,
        maxHeight: 60,
      ),
      child: MaterialButton(
        height: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: AppColors.buttonColor2,
            width: 2,
          ),
        ),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              leadingIcon,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
