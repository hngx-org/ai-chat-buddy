import 'package:chat_buddy/mock/message_data.dart';
import 'package:get/get.dart';

import 'package:chat_buddy/model/chat_model.dart';

class MessageController extends GetxController {
  late ChatModel? selectedChat;
  List<ChatModel> allChats = [];
  List<ChatModel> staredChats = [];

  // starChat() async {
  //   staredChats.add(selectedChat);
  // }

  // unstarChat(ChatModel chat) async {
  //   staredChats.removeWhere((element) => element == chat);
  // }

  initMessages() {
    for (int i = 0; i < messageData.length; i++) {
      allChats.add(
        ChatModel.fromMap(messageData.values.elementAt(i)),
      );
    }
    allChats.forEach((element) {
      print(element.messageContent);
    });
  }

  sendMessage(ChatModel newChat) async {
    allChats.add(newChat);
  }

  clearChatHistory() async {
    allChats.clear();
    staredChats.clear();
    selectedChat = null;
  }
}
