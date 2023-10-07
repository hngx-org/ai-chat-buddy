import 'package:hive_flutter/hive_flutter.dart';

part 'chat_model.g.dart';

@HiveType(typeId: 2)
class ChatModel {
  ChatModel({
    required this.messageContent,
    this.messageHeader,
    this.userSent = true,
    this.isStarred = false,
  }) {
    dateSent = DateTime.now();
    timeSent = DateTime.now();
  }

  @HiveField(0)
  String? messageHeader;
  @HiveField(1)
  String messageContent;
  @HiveField(2)
  late DateTime dateSent;
  @HiveField(3)
  late DateTime timeSent;
  @HiveField(4)
  bool userSent;
  @HiveField(5)
  bool isStarred;

  factory ChatModel.fromMap(Map<String, dynamic> chat) {
    return ChatModel(
      messageContent: chat['message_content'],
      userSent: chat['user_sent'],
    );
  }
}
