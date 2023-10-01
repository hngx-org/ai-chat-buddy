import 'package:chat_buddy/views/chatscreens/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({
    super.key,
    required this.text,
    required this.sender,
    required this.isMe,
    this.isStarred = false,
  });

  final String text;
  final String sender;
  final bool isMe;
  bool isStarred;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 16),
          child: CircleAvatar(child: Text(sender[0])),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sender, style: Theme.of(context).textTheme.titleMedium),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Text(text),
            )
          ],
        ))
      ],
    );
  }
}
