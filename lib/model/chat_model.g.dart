// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatModelAdapter extends TypeAdapter<ChatModel> {
  @override
  final int typeId = 2;

  @override
  ChatModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatModel(
      messageContent: fields[1] as String,
      messageHeader: fields[0] as String?,
      userSent: fields[4] as bool,
      isStarred: fields[5] as bool,
    )
      ..dateSent = fields[2] as DateTime
      ..timeSent = fields[3] as DateTime;
  }

  @override
  void write(BinaryWriter writer, ChatModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.messageHeader)
      ..writeByte(1)
      ..write(obj.messageContent)
      ..writeByte(2)
      ..write(obj.dateSent)
      ..writeByte(3)
      ..write(obj.timeSent)
      ..writeByte(4)
      ..write(obj.userSent)
      ..writeByte(5)
      ..write(obj.isStarred);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
