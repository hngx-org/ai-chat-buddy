import 'dart:async';

import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/controller/message_controller.dart';
import 'package:chat_buddy/controller/user_controller.dart';
import 'package:chat_buddy/model/chat_model.dart';
import 'package:chat_buddy/views/chatscreens/animation.dart';
import 'package:chat_buddy/views/chatscreens/chat_messages.dart';
import 'package:chat_buddy/views/chatscreens/landing_page_screen.dart';
import 'package:chat_buddy/views/chatscreens/onboarding_screen.dart';
import 'package:chat_buddy/views/profileScreens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_buddy/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<ChatModel> _messages = [];
  MessageController messageController = Get.put(MessageController());
  UserController userController = Get.put(UserController());
  bool isTyping = false;
  final FocusNode _focusNode = FocusNode();

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      setState(() {
        isTyping = true;
      });

      await messageController.sendMessage(
        ChatModel(messageContent: _controller.text),
        userController.cookie,
      );

      setState(() {
        isTyping = false;
        _controller.clear();
      });
    }
  }

  void _toggleStar(int index) {
    setState(() {
      _messages[index].isStarred = _messages[index].isStarred;
    });
  }

  Widget _buildTextComposer() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              controller: _controller,
              onSubmitted: (value) => _sendMessage(),
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white30,
                hintStyle: const TextStyle(
                  color: Colors.white60,
                ),
                hintText: "Send a message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          CircleAvatar(
            backgroundColor: AppColors.receiverChatBubble,
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: isTyping ? null : () => _sendMessage(),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _messages = messageController.allChats;
    return Scaffold(
      body: GradientBackground(
        child: GestureDetector(
          onTap: () {
            _focusNode.unfocus();
          },
          child: Column(children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ProfileScreen());
                    },
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('lib/assets/img4.jpg'),
                    ),
                  ),
                  const Text(
                    "Chat Buddy",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                reverse: true, // Set reverse to true
                child: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: _messages.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final currentMessage = _messages[index];
                      return Align(
                        alignment: currentMessage.userSent
                            ? Alignment.bottomRight
                            : Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: !currentMessage.userSent
                                  ? Alignment.bottomLeft
                                  : Alignment.bottomRight,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                constraints:
                                    const BoxConstraints(maxWidth: 700),
                                margin: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: currentMessage.userSent
                                      ? AppColors.senderChatBubble
                                      : AppColors.receiverChatBubble,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: const Radius.circular(12),
                                    topRight: const Radius.circular(12),
                                    bottomRight: currentMessage.userSent
                                        ? const Radius.circular(0)
                                        : const Radius.circular(12),
                                    topLeft: currentMessage.userSent
                                        ? const Radius.circular(12)
                                        : const Radius.circular(0),
                                  ),
                                ),
                                child: ChatMessage(
                                  text: currentMessage.messageContent,
                                  sender: currentMessage.userSent
                                      ? 'User'
                                      : 'Buddy',
                                  isMe: currentMessage.userSent,
                                ),
                              ),
                            ),
                            Align(
                              alignment: !currentMessage.userSent
                                  ? Alignment.bottomLeft
                                  : Alignment.bottomRight,
                              child: Text(
                                DateFormat.Hm().format(currentMessage.timeSent),
                                style: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: TypingIndicator(
                showIndicator: isTyping,
              ),
            ),
            SizedBox(
              height: 60,
              child: _buildTextComposer(),
            ),
          ]),
        ),
      ),
    );
  }
}
