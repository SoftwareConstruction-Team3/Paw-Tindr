import 'package:flutter_test/flutter_test.dart';
import 'package:paw_tindr/models/owner.dart';
import 'package:paw_tindr/models/pet.dart';
import 'package:uuid/uuid.dart';

void main() {
  group('Test models used by widgets', () {
    test('owner class holds right info', () {
      // Build owner and pets with mock data
      var owner = Owner('1','Test', 'Last Name', 'test123', '1234',
          DateTime.utc(2022).toString(), 'Test Address Dr.', '79968', []);

      expect(owner.firstName, 'Test');
      expect(owner.lastName, 'Last Name');
      expect(owner.email, 'test123@gmail.com');
      expect(owner.password, '1234');
      expect(owner.address, 'Test Address Dr.');
      expect(owner.zipcode, '79968');
    });

    test('pet holds correct information', () {
      // Build owner and pets with mock data
      var petId = const Uuid().v1();
      var owner = Owner('1', 'Test', 'Last Name', 'test123', '1234',
          DateTime.utc(2022).toString(), 'Test Address Dr.', '79968', []);
      var pet =
          Pet('Test Pet', 'Husky', petId, owner.id, 'Test description', -1, {});

      expect(pet.name, 'Test Pet');
      expect(pet.breed, 'Husky');
      expect(pet.id, petId);
      expect(pet.owner, owner);
      expect(pet.description, 'Test description');
      expect(pet.rating, -1);
    });

    test('owner can add pet', () {
      // Build owner and pets with mock data
      var petId = const Uuid().v1();
      var owner = Owner('1', 'Test', 'Last Name', 'test123', '1234',
          DateTime.utc(2022).toString(), 'Test Address Dr.', '79968', []);
      var pet =
          Pet('Test Pet', 'Husky', petId, owner.id, 'Test description', -1, {});

      owner.addPet(pet);

      expect(owner.pets.length, 1);
      expect(owner.pets.contains(petId), true);
    });

    test('owner can remove pet', () {
      // Build owner and pets with mock data
      var petId = const Uuid().v1();
      var owner = Owner('1', 'Test', 'Last Name', 'test123', '1234',
          DateTime.utc(2022).toString(), 'Test Address Dr.', '79968', []);
      var pet =
          Pet('Test Pet', 'Husky', petId, owner.id, 'Test description', -1, {});

      owner.addPet(pet);

      //Remove pet
      owner.removePet(pet);

      // Verify that our app begins at login screen
      expect(owner.pets.length, 0);
      expect(owner.pets.contains(petId), false);
    });

    test('owner build to and rebuild from map', () {
      // Build owner and pets with mock data
      var petId = const Uuid().v1();
      var owner = Owner('1', 'Test', 'Last Name', 'test123', '1234',
          DateTime.utc(2022).toString(), 'Test Address Dr.', '79968', []);
      var pet =
      Pet('Test Pet', 'Husky', petId, owner.id, 'Test description', -1, {});

      owner.addPet(pet);

      var map = owner.toMap();
      var ownerFromMap = Owner.fromMap(map);

      expect(owner.firstName, ownerFromMap.firstName);
      expect(owner.lastName, ownerFromMap.lastName);
      expect(owner.email, ownerFromMap.email);
      expect(owner.password, ownerFromMap.password);
      expect(owner.address, ownerFromMap.address);
      expect(owner.zipcode, ownerFromMap.zipcode);
    });
  });
}
