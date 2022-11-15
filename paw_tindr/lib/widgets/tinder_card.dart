import 'package:flutter/material.dart';
// import 'package:swipe/swipe.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:paw_tindr/providers/card_provider.dart';
import 'package:provider/provider.dart';

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
          '3 months old',
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

  Widget buildFrontCard() {
    return GestureDetector(
      child: Builder(
        builder: (context) {
          final provider = Provider.of<CardProvider>(context);
          final position = provider.position;
          final milliseconds = 0;

          return AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: milliseconds),
            transform: Matrix4.identity()..translate(position.dx, position.dy),
            child: buildCard(),
          );
        }
      ),
      onPanStart: (details) {
        final provider = Provider.of<CardProvider>(context, listen: true);
        provider.startPosition(details);
      },
      onPanUpdate: (details) {
        final provider = Provider.of<CardProvider>(context, listen: true);
        provider.updatePosition(details);
      },
      onPanEnd: (details) {
        final provider = Provider.of<CardProvider>(context, listen: true);
        provider.endPosition();
      }, 
    );
  }

  Widget buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 450.0,
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

  @override
  Widget build(BuildContext context) {
    // return buildFrontCard();
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 450.0,
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