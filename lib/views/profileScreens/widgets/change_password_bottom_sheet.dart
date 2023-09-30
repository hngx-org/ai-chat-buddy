import 'package:chat_buddy/views/profileScreens/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordBottomSheet extends StatefulWidget {
  const ChangePasswordBottomSheet({
    super.key,
  });

  @override
  State<ChangePasswordBottomSheet> createState() =>
      _ChangePasswordBottomSheetState();
}

class _ChangePasswordBottomSheetState extends State<ChangePasswordBottomSheet> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height / 2.5,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 2.5,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 33, 20, 104),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Change Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'To change password, kindly input your old password to confirm your identity',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Form(
              child: Column(
                children: [
                  CustomTextField(
                    label: 'old password',
                    controller: passwordController,
                    hint: 'input password',
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      }
                      return 'input a password';
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: 'new password',
                    controller: newPasswordController,
                    hint: 'input new password',
                    validator: (value) {
                      if (value != null && value.length > 6) {
                        return null;
                      }
                      return 'password cannot be less than 6';
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: 'confirm password',
                    controller: confirmPasswordController,
                    hint: 'confirm password',
                    validator: (value) {
                      if (value != null &&
                          value == newPasswordController.text) {
                        return null;
                      }
                      return 'passwords do not match';
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  textColor: Colors.white,
                  height: 50,
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                MaterialButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: () {},
                  textColor: Colors.white,
                  minWidth: 100,
                  height: 50,
                  color: Colors.red,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Change',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
