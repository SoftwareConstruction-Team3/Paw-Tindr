import 'message.dart';

class Chat {
  String ownerFirstName;
  String ownerLastName;
  String matchID;
  String matchFirstName;
  String matchLastName;
  String lastMessege;
  String imageurl;
  List<Message> messageList;

  Chat(
      this.ownerFirstName,
      this.ownerLastName,
      this.matchID,
      this.matchFirstName,
      this.matchLastName,
      this.lastMessege,
      this.imageurl,
      this.messageList);

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
    return lastMessege;
  }

  String getMatchID() {
    return matchID;
  }
}
