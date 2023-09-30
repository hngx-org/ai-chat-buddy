import 'package:chat_buddy/views/chatscreens/chat_messages.dart';
import 'package:flutter/material.dart';
import 'package:chat_buddy/constants/app_colors.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _sendMessage() {
    ChatMessage _message = ChatMessage(text: _controller.text, sender: "user");

    setState(() {
      _messages.insert(0, _message);
    });

    _controller.clear();
  }

  Widget _buildTextComposer() {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8), // Add padding here
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (value) => _sendMessage(),
              decoration: InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ),
          IconButton(onPressed: () => _sendMessage(), icon: Icon(Icons.send))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chat Buddy",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {
              // Add functionality to star messages
            },
          ),
        ],
      ),
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 83, 31, 117),
              Color.fromARGB(255, 18, 28, 136),
            ],
          ),
        ),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.all(8),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return _messages[index];
                  }),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: _buildTextComposer(),
            ),
          ],
        ),
      )),
    );
  }
}
