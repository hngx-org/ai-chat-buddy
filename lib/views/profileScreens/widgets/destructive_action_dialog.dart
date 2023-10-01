import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DestructiveActionDialog extends StatelessWidget {
  const DestructiveActionDialog({
    super.key,
    required this.onYes,
  });

  final VoidCallback onYes;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                'You are about to perform a destructive, irreversible process.\nAre you sure you want to continue?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  textColor: Colors.white,
                  minWidth: 100,
                  height: 50,
                  child: const Text(
                    'No',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: onYes,
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
                    'Sure',
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
