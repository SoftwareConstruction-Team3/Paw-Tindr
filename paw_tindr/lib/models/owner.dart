import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paw_tindr/models/pet.dart';

class Owner {
  late String firstName;
  late String lastName;
  late String username;
  late String password;
  late DateTime birthDate;
  late String address;
  late String zipcode;
  late Map<String, Pet> pets;


  Owner(this.firstName, this.lastName, this.username, this.password,
      this.birthDate, this.address, this.zipcode, this.pets);

  Owner.fromMap(Map<String, dynamic> map) {
    firstName = map['first_name'];
    lastName = map['last_name'];
    username = map['username'];
    password = map['password'];
    birthDate = map['birth_date'];
    address = map['address'];
    zipcode = map['zipcode'];
    pets = map['pets'];
  }

  Owner.fromSnapshot(DocumentSnapshot snapshot) {
    firstName = snapshot['first_name'];
    lastName = snapshot['last_name'];
    username = snapshot['username'];
    password = snapshot['password'];
    birthDate = snapshot['birth_date'];
    address = snapshot['address'];
    zipcode = snapshot['zipcode'];
    pets = snapshot['pets'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'password': password,
      'birth_date': birthDate,
      'address': address,
      'zipcode': zipcode,
      'pets': pets
    };
  }
}