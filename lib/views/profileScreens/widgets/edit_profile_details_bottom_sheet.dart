import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/controller/user_controller.dart';
import 'package:chat_buddy/views/profileScreens/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileDetailsBottomSheet extends StatefulWidget {
  const EditProfileDetailsBottomSheet({super.key});

  @override
  State<EditProfileDetailsBottomSheet> createState() =>
      _EditProfileDetailsBottomSheetState();
}

class _EditProfileDetailsBottomSheetState
    extends State<EditProfileDetailsBottomSheet> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  UserController userController = Get.put(UserController());

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    super.dispose();
  }

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
              'Update Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Initial values are gotten from the current details',
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
                    label: 'username',
                    controller: usernameController,
                    hint: usernameController.text,
                    isPassword: false,
                    validator: (value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    isPassword: false,
                    label: 'email',
                    controller: emailController,
                    hint: emailController.text,
                    validator: (value) {
                      return null;
                    },
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
                  onPressed: () {
                    userController.updateUser(
                      username: usernameController.text,
                      email: emailController.text,
                    );
                    Get.back();
                  },
                  textColor: Colors.white,
                  minWidth: 100,
                  height: 50,
                  color: AppColors.purple,
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
