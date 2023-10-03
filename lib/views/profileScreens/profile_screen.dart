import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/controller/user_controller.dart';
import 'package:chat_buddy/views/profileScreens/about_page.dart';
import 'package:chat_buddy/views/profileScreens/subscription_details_screen.dart';
import 'package:chat_buddy/views/profileScreens/widgets/change_password_bottom_sheet.dart';
import 'package:chat_buddy/views/profileScreens/widgets/custom_profile_icon.dart';
import 'package:chat_buddy/views/profileScreens/widgets/destructive_action_dialog.dart';
import 'package:chat_buddy/views/profileScreens/widgets/edit_profile_details_bottom_sheet.dart';
import 'package:chat_buddy/views/authscreens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            const SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text('Profile Screen'),
              foregroundColor: Colors.white,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(bottom: 20),
                    child: Column(
                      // shrinkWrap: true,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.buttonColor2,
                          radius: 72,
                          child: const CircleAvatar(
                            backgroundImage: AssetImage(
                              'lib/assets/img4.jpg',
                            ),
                            backgroundColor: Colors.transparent,
                            radius: 70,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () => Text(
                            userController.username,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Obx(
                          () => Text(
                            userController.email,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomProfileButton(
                          label: 'Edit Profile Details',
                          leadingIcon: MdiIcons.bookEditOutline,
                          onPressed: () async {
                            Get.bottomSheet(
                              const EditProfileDetailsBottomSheet(),
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.deepPurple.withOpacity(.3),
                            );
                            // int response = 0;
                            // response = await loadToScreen(
                            //   context: context,
                            //   asyncComputation: () => Future.delayed(
                            //     const Duration(seconds: 3),
                            //     () => 4,
                            //   ),
                            // );
                            // print(response);
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomProfileButton(
                          label: 'Subscription Details',
                          leadingIcon: MdiIcons.piggyBankOutline,
                          onPressed: () {
                            Get.to(() => const SubscriptionDetailsScreen());
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomProfileButton(
                          label: 'Change Password',
                          leadingIcon: MdiIcons.lockReset,
                          onPressed: () {
                            Get.bottomSheet(
                              const ChangePasswordBottomSheet(),
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.deepPurple.withOpacity(.3),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomProfileButton(
                          label: 'About',
                          leadingIcon: MdiIcons.informationSlabCircleOutline,
                          onPressed: () {
                            Get.to(() => const AboutPage());
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomProfileButton(
                          label: 'Clear Chat History',
                          leadingIcon: MdiIcons.deleteForeverOutline,
                          onPressed: () {
                            Get.dialog(
                              DestructiveActionDialog(
                                onYes: () {
                                  //Todo: put the funnction for clearing chats
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomProfileButton(
                          label: 'Logout',
                          leadingIcon: MdiIcons.logout,
                          onPressed: () {
                            Get.offUntil(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                            // userController.logoutUser();
                            //Todo: go to login page
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
