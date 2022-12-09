import 'package:cloud_firestore/cloud_firestore.dart';

import 'message.dart';

class Chat {
  late String ownerFirstName;
  late String ownerLastName;
  late String matchID;
  late String matchFirstName;
  late String matchLastName;
  late String lastMessage;
  late String imageUrl;
  late List<Message> messageList = [];

  Chat(
      this.ownerFirstName,
      this.ownerLastName,
      this.matchID,
      this.matchFirstName,
      this.matchLastName,
      this.lastMessage,
      this.imageUrl,
      this.messageList);

  Chat.fromMap(Map<String, dynamic> map) {
    ownerFirstName = map['owner_first_name'];
    ownerLastName = map['owner_last_name'];
    matchID = map['match_id'];
    matchFirstName = map['match_first_name'];
    matchLastName = map['match_last_name'];
    lastMessage = map['last_message'];
    imageUrl = map['image_url'];
    map['message_list'].forEach((message) {
      messageList.add(Message.fromMap(message));
    });
  }

  Chat.fromSnapshot(DocumentSnapshot snapshot) {
    ownerFirstName = snapshot['owner_first_name'];
    ownerLastName = snapshot['owner_last_name'];
    matchID = snapshot['match_id'];
    matchFirstName = snapshot['match_first_name'];
    matchLastName = snapshot['match_last_name'];
    lastMessage = snapshot['last_message'];
    imageUrl = snapshot['image_url'];
    messageList = snapshot['message_list'];
  }
  Map<String, dynamic> toMap() {
    var listMaps = [];
    for (var message in messageList) { listMaps.add(message.toMap());}
    return <String, dynamic>{
      'owner_first_name': ownerFirstName,
      'owner_last_name': ownerLastName,
      'match_id': matchID,
      'match_first_name': matchFirstName,
      'match_last_name': matchLastName,
      'last_message': lastMessage,
      'image_url': imageUrl,
      'message_list': listMaps
    };
  }

  List<Message> getMessages() {
    return messageList;
  }

  String getOwnerFirstName() {
    return ownerFirstName;
  }

  String getOwnerLastName() {
    return ownerLastName;
  }

  String getMatchFirstName() {
    return matchFirstName;
  }

  String getMatchLastName() {
    return matchLastName;
  }

  String getLastMessege() {
    return lastMessage;
  }

  String getMatchID() {
    return matchID;
  }
}
