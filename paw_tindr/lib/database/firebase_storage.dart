import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paw_tindr/models/owner.dart';

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
  owners.add({
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
  pets.add({
    'name': name,
    'breed': breed,
    'id': id,
    'owner': owner,
    'description': description,
    'rating': rating,
    'matches': {}
  });
}
