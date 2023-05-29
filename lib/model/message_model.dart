class MessageModel {
  String? messageid;
  String? sender;
  String? text;
  bool? seen;
  DateTime? createdon;

  MessageModel(
      {this.sender, this.text, this.seen, this.createdon, this.messageid});

  factory MessageModel.fromMap(map) {
    return MessageModel(
        sender: map['sender'],
        text: map['text'],
        messageid: map['messageid'],
        seen: map['seen'],
        createdon: map['createdon'].toDate());
  }
  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'message': messageid,
      'text': text,
      'seen': seen,
      'createdon': createdon,
    };
  }
}
