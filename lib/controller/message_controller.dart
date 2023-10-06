import 'dart:math';

import 'package:get/get.dart';

import 'package:chat_buddy/model/chat_model.dart';
import 'package:hngx_openai/repository/openai_repository.dart';

class MessageController extends GetxController {
  late ChatModel? selectedChat;
  RxList<ChatModel> allChats = <ChatModel>[].obs;
  List<ChatModel> staredChats = [];

  OpenAIRepository openAI = OpenAIRepository();

  // starChat() async {
  //   staredChats.add(selectedChat);
  // }

  // unstarChat(ChatModel chat) async {
  //   staredChats.removeWhere((element) => element == chat);
  // }

  initMessages() {
    //TODO: Work on this
  }

  // Future<void> sendMessage(ChatModel newChat, String cookie) async {
  //   allChats.add(newChat);
  //   final response = await openAI.getChat(newChat.messageContent, cookie);
  //   allChats.add(
  //     ChatModel(
  //       messageContent: response.contains('Error: Subscription Required')
  //           ? randomText()
  //           : response.replaceFirst('Message:', '').trimLeft(),
  //       userSent: false,
  //     ),
  //   );
  // }

  String randomText() {
    int index = Random().nextInt(1);
    final responses = [
      'You have reached your limit for the day, Kindly Subscribe to continue',
    ];
    return responses[index];
  }

  Future<void> sendMessage(ChatModel newChat, String cookie) async {
    allChats.add(newChat);
    final response = await openAI.getChat(newChat.messageContent, cookie);
    allChats.add(
      ChatModel(
        messageContent: response.contains('Error: Subscription Required')
            ? randomText()
            : response.contains('Error:')
                ? randomTextTwo()
                : response.replaceFirst('Message:', '').trimLeft(),
        userSent: false,
      ),
    );
  }

  String randomTextTwo() {
    return 'Server is currently down';
  }

  clearChatHistory() async {
    allChats.clear();
    staredChats.clear();
    selectedChat = null;
  }
}
