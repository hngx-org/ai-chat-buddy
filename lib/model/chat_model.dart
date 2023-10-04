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

  
  String? messageHeader;
  String messageContent;
  //TODO: Convert this to date time and year
  late DateTime dateSent;
  //TODO: Convert this to time
  late DateTime timeSent;
  bool userSent;
  bool isStarred;

  factory ChatModel.fromMap(Map<String, dynamic> chat) {
    return ChatModel(
      messageContent: chat['message_content'],
      userSent: chat['user_sent'],
    );
  }
}
