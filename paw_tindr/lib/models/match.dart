import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:paw_tindr/models/pet.dart';
import 'package:paw_tindr/models/owner.dart';
import 'package:paw_tindr/models/chat.dart';

class Match extends StatelessWidget {
  // String currentPetID;
  // String otherPetID;
  // String ownerUserName;
  // String otherOwnerUserName;
  // bool matchResult;

  // Match(this.currentPetID, this.otherPetID, this.ownerUserName,
  //     this.otherOwnerUserName, this.matchResult);

  // void displayMatch() {}

  // void goToChat() {}

  // void sendFirstMessage() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: const Color.fromARGB(255, 243, 144, 5),
        child: const Text(
          'currentPetID, otherPetID, ownerUserName, otherOwnerUserName, matchResult',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
