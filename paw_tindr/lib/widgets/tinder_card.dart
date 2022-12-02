import 'package:flutter/material.dart';

class TinderCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String age;
  final String breed;
  final String imagePath;
const TinderCard({ 
  Key? key, 
  required this.firstName, 
  required this.lastName, 
  required this.age,
  required this.breed,
  required this.imagePath,
  }) : super(key: key);

  Row _displayName() {
    return Row(
      children: [
        Text(
          firstName,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          lastName,
          style: const TextStyle(
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
        const Icon(
          Icons.cake_outlined,
          size: 16,
          color: Colors.white,
        ),
        const SizedBox(width: 16),
        Text(
          age,
          style: const TextStyle(
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
        const Icon(
          Icons.pets,
          size: 16,
          color: Colors.white,
        ),
        const SizedBox(width: 16),
        Text(
          breed,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]
    );
  }

  Widget buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 450.0,
        width: 300.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/p.png'),
            fit: BoxFit.fill,
          ),
        ),
        color: Colors.red,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 1],
            ),
          ),
          child: Column(
            children: [
              const Spacer(),
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          ),
        ),
        // color: Colors.red,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 1],
            ),
          ),
          child: Column(
            children: [
              const Spacer(),
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