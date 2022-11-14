import 'package:flutter/material.dart';
// import 'package:swipe/swipe.dart';

class TinderCard extends StatefulWidget {
  // final colorCard;

  // TinderCard({this.colorCard});

  const TinderCard({Key? key}) : super(key: key);

  @override
  State<TinderCard> createState() => _TinderCard();
  
}

class _TinderCard extends State<TinderCard> {
  Row _displayName() {
    return Row(
      children: [
        Text(
          'Travy',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          'Patty',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Row _displayAge() {
    return Row(
      children: [
        Text(
          '~Icon~',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          'Patty',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
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
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          'Golden Retriver',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 599.0,
        width: 300.0,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/p.png'),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        color: Colors.red,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 1],
            ),
          ),
          child: Column(
            children: [
              Spacer(),
              _displayName(),
              _displayAge(),
              _displayBreed(),
            ],
          ),
        ),
      ),
    );
  }
}