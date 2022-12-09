import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paw_tindr/models/message.dart';
import 'package:paw_tindr/models/owner.dart';
import '../models/chat.dart';
import '../models/pet.dart';

/// Method to register an owner into fire store
Future<void> registerOwnerAndPet(
    String firstName,
    String lastName,
    String email,
    String password,
    String birthDate,
    String address,
    String zipcode,
    List<String> pets) async {
  CollectionReference owners = FirebaseFirestore.instance.collection('Owners');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  owners.doc('${uid}').set({
    'id': uid,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'password': password,
    'birth_date': birthDate,
    'address': address,
    'zipcode': zipcode,
    'pets': pets
  });
}

Future<void> registerPet(String name, String breed, String id, String owner,
    String description, int rating, Map<String, Pet> matches) async {
  CollectionReference pets = FirebaseFirestore.instance.collection('Pets');
  pets.doc(id).set({
    'name': name,
    'breed': breed,
    'id': id,
    'owner': owner,
    'description': description,
    'rating': rating,
    'matches': {}
  });
}

Future<void> addMessage(Message message, String matchID) async {
  DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
      .collection('Chats')
      .doc('${FirebaseAuth.instance.currentUser?.uid}')
      .get();
  List<dynamic> rawChats = documentSnapshot.get('chats');
  List<Chat> chats = [];
  for (var chat in rawChats) {
    chats.add(Chat.fromMap(chat));
  }
  Chat currentChat = chats.firstWhere((chat) => chat.matchID == matchID);
  currentChat.messageList.add(message);
  currentChat.lastMessage = message.text;

  var chatMapList = [];
  for (var chat in chats) {
    chatMapList.add(chat.toMap());
  }

  documentSnapshot.reference.set({'chats': FieldValue.arrayUnion(chatMapList)});
}
