import 'dart:math';

import 'package:chat_buddy/constants/db_constants.dart';
import 'package:chat_buddy/database/local_db.dart';
import 'package:get/get.dart';

import 'package:chat_buddy/model/chat_model.dart';
import 'package:hngx_openai/repository/openai_repository.dart';

class MessageController extends GetxController {
  final localDb = OfflineDatabase(dbName: messagedb);
  late ChatModel? selectedChat;
  RxList<ChatModel> allChats = <ChatModel>[].obs;
  List<ChatModel> staredChats = [];

  OpenAIRepository openAI = OpenAIRepository();

  initMessages() async {
    final loginStateTemp = await localDb.retrieveData<bool>(onboardingDb);
    bool? loginState = loginStateTemp.isEmpty ? null : true;

    if (loginState == true) {
      await retrieveMessage();
    }
  }

  Future<void> retrieveMessage() async {
    for (ChatModel i in await localDb.retrieveData<ChatModel>(messagedb)) {
      allChats.add(i);
    }
  }

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
    final aiResponse = ChatModel(
      messageContent: response.contains('Error: Subscription Required')
          ? randomText()
          : response.contains('Error:')
              ? randomTextTwo()
              : response.replaceFirst('Message:', '').trimLeft(),
      userSent: false,
    );
    await localDb.addData<ChatModel>(newChat, null);
    await localDb.addData<ChatModel>(aiResponse, null);
    allChats.add(aiResponse);
  }

  String randomTextTwo() {
    return 'Server is currently down';
  }

  Future<void> clearChatHistory() async {
    allChats.clear();
    await localDb.deleteDatabase<ChatModel>();
    staredChats.clear();
    selectedChat = null;
  }
}
