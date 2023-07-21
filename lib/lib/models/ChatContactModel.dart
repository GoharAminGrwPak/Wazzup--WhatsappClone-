class ChatContactModel {
   String? name;
   String? profilePic;
   String? contactId;
   DateTime? timeSent;
   bool isSelected=false;
   String? lastMessage;
   String? status;

  ChatContactModel();
  ChatContactModel.param({
    required this.name,
    required this.profilePic,
    required this.contactId,
    required this.timeSent,
    required this.lastMessage,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'profilePic': profilePic,
      'contactId': contactId,
      'timeSent': timeSent?.millisecondsSinceEpoch,
      'lastMessage': lastMessage,
    };
  }

  factory ChatContactModel.fromMap(Map<String, dynamic> map) {
    return ChatContactModel.param(
      name: map['name'] ?? '',
      profilePic: map['profilePic'] ?? '',
      contactId: map['contactId'] ?? '',
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
      lastMessage: map['lastMessage'] ?? '',
      status: map['lastMessage'] ?? '',
    );
  }
}
