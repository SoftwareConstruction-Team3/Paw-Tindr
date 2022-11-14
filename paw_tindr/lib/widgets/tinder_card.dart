import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class TinderCard extends StatefulWidget {
  final color;

  TinderCard({});

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {

  Row _displayName() {
    return Row(
      children: [
        Text(
          'Travy',
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          'Patty',
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]
    );
  }

  Row _displayAge() {
    return Row(
      children: [
        Text(
          '~Icon~',
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          'Patty',
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]
    );
  }

  Row _displayBreed() {
    return Row(
      children: [
        Text(
          '~Icon~',
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          'Somebreed idk',
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Swipable(
      child: Container(
        color: color,
      ),
    );
  }
}