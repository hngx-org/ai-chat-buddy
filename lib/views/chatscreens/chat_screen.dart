import 'dart:async';

import 'package:chat_buddy/views/chatscreens/chat_messages.dart';
import 'package:chat_buddy/views/chatscreens/landing_page_screen.dart';
import 'package:chat_buddy/views/chatscreens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_buddy/constants/app_colors.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

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
    Timer(Duration(seconds: 1), _getChatBuddyResponse);
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
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (value) => _sendMessage(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Send a message",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          SizedBox(width: 5),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: Icon(Icons.send),
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [AppColors.secondaryColor, AppColors.primaryColor],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => OnboardingScreen());
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('lib/assets/avatar1.jpg'),
                ),
              ),
              Text(
                "Chat Buddy",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: _messages[index].isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Stack(
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 300),
                        margin: EdgeInsets.symmetric(
                          vertical: 4,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: _messages[index].isMe
                              ? AppColors.senderChatBubble
                              : AppColors.receiverChatBubble,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: !_messages[index].isMe
                                ? Radius.circular(0)
                                : Radius.circular(12),
                            bottomRight: _messages[index].isMe
                                ? Radius.circular(0)
                                : Radius.circular(12),
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
                              ? Icon(Icons.star, color: Colors.yellow, size: 15)
                              : Icon(Icons.star_border, size: 15),
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
