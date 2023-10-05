import 'package:chat_buddy/constants/app_colors.dart';
import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/controller/user_controller.dart';
import 'package:chat_buddy/helper/loading_widget.dart';
import 'package:chat_buddy/views/profileScreens/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:get/get.dart';
import 'package:in_app_payment/in_app_payment.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SubscriptionDetailsScreen extends StatefulWidget {
  const SubscriptionDetailsScreen({super.key});

  @override
  State<SubscriptionDetailsScreen> createState() =>
      SubscriptionDetailsScreenState();
}

class SubscriptionDetailsScreenState extends State<SubscriptionDetailsScreen> {
  UserController userController = Get.put(UserController());
  late MaskedTextController cardNumberController;

  late MaskedTextController expiryDateController;
  TextEditingController cardHolderNameController = TextEditingController();
  late MaskedTextController cvvController;

  final pay = HNGPay();

  @override
  void initState() {
    cardNumberController = MaskedTextController(mask: "0000 0000 0000 0000");
    expiryDateController = MaskedTextController(mask: "00/00");
    cvvController = MaskedTextController(mask: '000');
    super.initState();
  }

  @override
  void dispose() {
    cardHolderNameController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                foregroundColor: AppColors.white,
                title: const Text(
                  'Subscription',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userController.username,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SubscriptionPageDualTextWidget(
                      label: 'Account Type:',
                      valueText: userController.subscriptionType,
                    ),
                    const SizedBox(height: 5),
                    SubscriptionPageDualTextWidget(
                      label: 'Subscription Status:',
                      valueText: userController.subscriptionStatus
                          ? 'Active'
                          : 'Not Active',
                    ),
                    const SizedBox(height: 5),
                    SubscriptionPageDualTextWidget(
                      label: 'Days Left:',
                      valueText:
                          '${userController.subscriptionLeft.toString()} days left',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet:
          pay.googlePay(context, amountToPay: '3', userID: userController.id),
      //  InkWell(
      //   onTap: () {
      //     // userController.subscriptionLeft == 0
      //     if (true) {
      //       Get.bottomSheet(
      //         PaymentBottomSheet(
      //           cardNumberController: cardNumberController,
      //           expiryDateController: expiryDateController,
      //           cardHolderNameController: cardHolderNameController,
      //           cvvController: cvvController,
      //           payPortal: pay,
      //         ),
      //       );
      //     } else {
      //       Get.snackbar(
      //         'Error',
      //         'Please Wait for your subscription to end before re-subscribing',
      //         colorText: AppColors.white,
      //         duration: const Duration(seconds: 3),
      //         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      //       );
      //     }
      //   },
      //   child: Container(
      //     height: 60,
      //     width: MediaQuery.of(context).size.width,
      //     color: AppColors.senderChatBubble,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         const Text(
      //           'Pay',
      //           style: TextStyle(
      //             fontSize: 22,
      //             fontWeight: FontWeight.w500,
      //             color: Colors.white,
      //           ),
      //         ),
      //         const SizedBox(width: 10),
      //         Icon(
      //           MdiIcons.bankOutline,
      //           color: AppColors.primaryColor,
      //           size: 28,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({
    super.key,
    required this.cardNumberController,
    required this.expiryDateController,
    required this.cardHolderNameController,
    required this.cvvController,
    required this.payPortal,
  });

  final MaskedTextController cardNumberController;
  final MaskedTextController expiryDateController;
  final TextEditingController cardHolderNameController;
  final MaskedTextController cvvController;
  final HNGPay payPortal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
              'Subscribe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Please Input your card details\nNote: We do not save your details at all',
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
                    textInputType: TextInputType.number,
                    isPassword: false,
                    label: 'Card Number',
                    controller: cardNumberController,
                    hint: 'input number on card',
                    validator: (value) {
                      //
                      if (value != null && value.length == 16) {
                        return null;
                      }
                      return 'input a correct card number';
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    isPassword: false,
                    textInputType: TextInputType.number,
                    label: 'Expiry Date',
                    controller: expiryDateController,
                    hint: 'MM/YY',
                    validator: (value) {
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    isPassword: false,
                    label: 'Card Holder',
                    controller: cardHolderNameController,
                    hint: 'input name on card',
                    validator: (value) {
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    textInputType: TextInputType.number,
                    isPassword: false,
                    label: 'CVV',
                    controller: cvvController,
                    hint: 'enter cvv',
                    validator: (value) {
                      return null;
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
                  onPressed: () async {
                    //TODO: Implement payment here
                    //TODO: Test this on an android
                    // await payPortal.googlePay(amountToPay: '5');
                    // loadToScreen(
                    //   asyncComputation: () => Future.delayed(
                    //     const Duration(
                    //       seconds: 3,
                    //     ),
                    //   ),
                    //   context: context,
                    // );
                    Get.back();
                  },
                  textColor: Colors.white,
                  minWidth: 120,
                  height: 50,
                  color: AppColors.purple,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Pay \$5/month',
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

class SubscriptionPageDualTextWidget extends StatelessWidget {
  const SubscriptionPageDualTextWidget({
    super.key,
    required this.label,
    required this.valueText,
  });

  final String label;
  final String valueText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          valueText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
