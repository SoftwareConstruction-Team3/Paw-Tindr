import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paw_tindr/models/pet.dart';

class Owner {
  late String id;
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String birthDate;
  late String address;
  late String zipcode;
  late List<String> pets;


  Owner(this.id, this.firstName, this.lastName, this.email, this.password,
      this.birthDate, this.address, this.zipcode, this.pets);

  Owner.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    firstName = map['first_name'];
    lastName = map['last_name'];
    email = map['email'];
    password = map['password'];
    birthDate = map['birth_date'];
    address = map['address'];
    zipcode = map['zipcode'];
    pets = map['pets'];
  }

  Owner.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot['id'];
    firstName = snapshot['first_name'];
    lastName = snapshot['last_name'];
    email = snapshot['email'];
    password = snapshot['password'];
    birthDate = snapshot['birth_date'];
    address = snapshot['address'];
    zipcode = snapshot['zipcode'];
    pets = snapshot['pets'];
  }

  /// Adds pet to existing list of pets
  void addPet(Pet pet){
    pets.add(pet.id);
  }

  /// Remove pet from existing list of pets
  bool removePet(Pet pet) {
    if(pets.remove(pet.id) != null){
      return true;
    }
    return false;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'birth_date': birthDate,
      'address': address,
      'zipcode': zipcode,
      'pets': pets
    };
  }
}