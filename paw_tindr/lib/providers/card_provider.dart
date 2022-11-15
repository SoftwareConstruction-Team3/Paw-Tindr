import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  Offset _position = Offset.zero;

  Offset get position => _position;

  void startPosition(DragStartDetails details) {
    //
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    notifyListeners();
  }
  void endPosition() {
    //
  }
}