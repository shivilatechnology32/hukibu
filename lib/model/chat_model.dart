class ChatRoomModel {
  String? chatroomId;
  Map<String, dynamic>? participent;
  String? lastMessage;

  ChatRoomModel({this.chatroomId, this.participent, this.lastMessage});

  factory ChatRoomModel.fromMap(map) {
    return ChatRoomModel(
        chatroomId: map['chatroomid'],
        participent: map['paerticipent'],
        lastMessage: map['lastmessage']);
  }

  Map<String, dynamic> toMap() {
    return {
      'lastmessage': lastMessage,
      'chatroomid': chatroomId,
      'paerticipent': participent,
    };
  }
}
