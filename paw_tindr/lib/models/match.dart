import 'package:paw_tindr/models/pet.dart';
import 'package:paw_tindr/models/owner.dart';
import 'package:paw_tindr/models/chat.dart';

class Match {
  String currentPetID;
  String otherPetID;
  String ownerUserName;
  String otherOwnerUserName;
  bool matchResult;

  Match(this.currentPetID, this.otherPetID, this.ownerUserName,
      this.otherOwnerUserName, this.matchResult);

  void displayMatch() {}

  void goToChat() {}

  void sendFirstMessage() {}
}
