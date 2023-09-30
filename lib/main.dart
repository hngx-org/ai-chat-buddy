import 'package:chat_buddy/controller/message_controller.dart';
import 'package:get/get.dart';

void main() {
  MessageController messageController = Get.put(MessageController());
  messageController.initMessages();
}
