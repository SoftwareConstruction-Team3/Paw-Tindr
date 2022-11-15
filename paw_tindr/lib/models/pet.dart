import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'owner.dart';

class Pet {
  late String name;
  late String breed;
  late Uuid id;
  late Owner owner;
  late String description;
  late int rating;
  late Map<Uuid, Pet> matches;

  Pet.registration(this.name, this.breed, this.id, this.owner, this.description,
      this.matches);

  Pet(this.name, this.breed, this.id, this.owner, this.description, this.rating,
      this.matches);


  Pet.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    breed = map['breed'];
    id = map['id'];
    owner = map['owner'];
    description = map['description'];
    rating = map['rating'];
    matches = map['matches'];
  }

  Pet.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot['name'];
    breed = snapshot['breed'];
    id = snapshot['id'];
    owner = snapshot['owner'];
    description = snapshot['description'];
    rating = snapshot['rating'];
    matches = snapshot['matches'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'breed': breed,
      'id': id,
      'owner': owner,
      'description': description,
      'rating': rating,
      'matches': matches
    };
  }
}