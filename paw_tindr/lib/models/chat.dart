import 'message.dart';

class Chat {
  String ownerFirstName;
  String ownerLastName;
  String matchFirstName;
  String matchLastName;
  List<Message> messageList;


  Chat(this.ownerFirstName, this.ownerLastName, this.matchFirstName,
      this.matchLastName, this.messageList);

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
}