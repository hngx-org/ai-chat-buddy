import 'dart:async';

import 'package:chat_buddy/constants/app_widgets.dart';
import 'package:chat_buddy/views/chatscreens/chat_messages.dart';
import 'package:chat_buddy/views/profileScreens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_buddy/constants/app_colors.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _sendMessage() {
    ChatMessage _message = ChatMessage(
      text: _controller.text,
      sender: "user",
      isMe: true,
    );

    setState(() {
      _messages.insert(0, _message);
    });
    _controller.clear();

// Simulate ChatBuddy's response after a delay
    Timer(const Duration(seconds: 1), _getChatBuddyResponse);
  }

  void _getChatBuddyResponse() {
    ChatMessage chatBuddyMessage = ChatMessage(
      text: "This is ChatBuddy. How can I help you?",
      sender: "ChatBuddy",
      isMe: false,
    );

    setState(() {
      _messages.insert(0, chatBuddyMessage);
    });
  }

  void _toggleStar(int index) {
    setState(() {
      _messages[index].isStarred = !_messages[index].isStarred;
    });
  }

  // ChatMessage AImessage = ChatMessage(text: response!.text, sender: "ChatBuddy");

  Widget _buildTextComposer() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
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
              onPressed: () => _sendMessage(),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const ProfileScreen());
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('lib/assets/avatar1.jpg'),
              ),
            ),
            const Text(
              "Chat Buddy",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
      body: GradientBackground(
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: _messages[index].isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Stack(
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 300),
                        margin: const EdgeInsets.symmetric(
                          vertical: 4,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: _messages[index].isMe
                              ? AppColors.senderChatBubble
                              : AppColors.receiverChatBubble,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(12),
                            topRight: const Radius.circular(12),
                            bottomLeft: !_messages[index].isMe
                                ? const Radius.circular(0)
                                : const Radius.circular(12),
                            bottomRight: _messages[index].isMe
                                ? const Radius.circular(0)
                                : const Radius.circular(12),
                          ),
                        ),
                        child: _messages[index],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            _toggleStar(index);
                          },
                          icon: _messages[index].isStarred
                              ? const Icon(Icons.star,
                                  color: Colors.yellow, size: 15)
                              : const Icon(Icons.star_border, size: 15),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 60,
            child: _buildTextComposer(),
          ),
        ]),
      ),
    );
  }
}
