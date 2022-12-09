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
  late List<Pet> pets;

  Owner();

  Owner.details(this.id, this.firstName, this.lastName, this.email,
      this.password, this.birthDate, this.address, this.zipcode, this.pets);

  factory Owner.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Owner.details(
      data?['id'],
      data?['first_Name'],
      data?['last_Name'],
      data?['email'],
      data?['password'],
      data?['birth_date'],
      data?['address'],
      data?['zipcode'],
      List.from(data?['pets']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (firstName != null) "first_Name": firstName,
      if (lastName != null) "last_Name": lastName,
      if (email != null) "email": email,
      if (password != null) "password": password,
      if (birthDate != null) "birth_date": birthDate,
      if (address != null) "address": address,
      if (zipcode != null) "zipcode": zipcode,
      if (pets != null) "pets": pets,
    };
  }

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

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    birthDate = json['birth_date'];
    address = json['address'];
    zipcode = json['zipcode'];
    pets = json['pets'];
  }

  Owner.fromSnapshot(DocumentSnapshot<Object?> snapshot) {
    id = snapshot.get('id');
    firstName = snapshot.get('first_name');
    lastName = snapshot.get('last_name');
    email = snapshot.get('email');
    password = snapshot.get('password');
    birthDate = snapshot.get('birth_date');
    address = snapshot.get('address');
    zipcode = snapshot.get('zipcode');
    pets = snapshot.get('pets');
  }

  /// Adds pet to existing list of pets
  void addPet(Pet pet) {
    pets.add(pet);
  }

  /// Remove pet from existing list of pets
  bool removePet(Pet pet) {
    if (pets.remove(pet.id) != null) {
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

  Map<String, dynamic> toJson() {
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
