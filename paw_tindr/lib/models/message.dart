import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  late int epochTimeMs;
  late bool seen;
  late bool receiver;
  late String senderId;
  late String text;

  Message(this.epochTimeMs, this.seen, this.receiver, this.senderId, this.text);
  Message.constructor(String data);

  Message.fromMap(Map<String, dynamic> map) {
    epochTimeMs = map['epoch_time_ms'];
    seen = map['seen'];
    receiver = map['receiver'];
    senderId = map['sender_id'];
    text = map['text'];
  }

  Message.fromSnapshot(DocumentSnapshot snapshot) {
    epochTimeMs = snapshot['epoch_time_ms'];
    seen = snapshot['seen'];
    receiver = snapshot['receiver'];
    senderId = snapshot['sender_id'];
    text = snapshot['text'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'epoch_time_ms': epochTimeMs,
      'seen': seen,
      'receiver': receiver,
      'sender_id': senderId,
      'text': text
    };
  }
}
