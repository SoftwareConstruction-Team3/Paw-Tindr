import 'package:paw_tindr/models/pet.dart';
import 'package:paw_tindr/models/owner.dart';
import 'package:paw_tindr/models/chat.dart';

class Match {
  final String _currentPetID;
  final String _otherPetID;
  final String _ownerUserName;
  final String _otherOwnerUserName;
  final bool _matchResult;

  Match(
      {currentPetID,
      otherPetID,
      ownerUserName,
      otherOwnerUserName,
      matchResult})
      : this._currentPetID = currentPetID,
        this._otherPetID = otherPetID,
        this._ownerUserName = ownerUserName,
        this._otherOwnerUserName = otherOwnerUserName,
        this._matchResult = matchResult;

  String get currentPetID => _currentPetID;
  String get otherPetID => _otherPetID;
  String get ownerUserName => _ownerUserName;
  String get otherOwnerUserName => _otherOwnerUserName;
  bool get matchResult => _matchResult;
}
