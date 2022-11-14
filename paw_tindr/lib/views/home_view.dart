import 'package:flutter/material.dart';
import 'package:paw_tindr/widgets/tinder_card.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/header_logo.png'),
                width: 400.0,
                height: 100.0,
                fit: BoxFit.scaleDown,
                alignment: FractionalOffset.topCenter,
              ),
            ]
          ),
          Container(
            height: 300,
            width: 200,
            child: Stack(
              children: [
                TinderCard(color: Colors.black),
                TinderCard(color: Colors.red),
                TinderCard(color: Colors.blue),
              ]
            )
          ),
          TinderCard(),
        ],
      )
    );
  }
}
