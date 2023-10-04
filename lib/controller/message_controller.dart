import 'package:chat_buddy/mock/message_data.dart';
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

  Future<void> sendMessage(ChatModel newChat, String cookie) async {
    allChats.add(newChat);
    final response = await openAI.getChat(newChat.messageContent, cookie);
    print(response);
    allChats.add(
      ChatModel(
        messageContent: response
            .replaceFirst('Message:', '')
            .replaceFirst('Error:', '')
            .trimLeft(),
        userSent: false,
      ),
    );
  }

  clearChatHistory() async {
    allChats.clear();
    staredChats.clear();
    selectedChat = null;
  }
}
