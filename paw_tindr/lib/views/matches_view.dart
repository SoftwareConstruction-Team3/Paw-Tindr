import 'package:flutter/material.dart';

class MatchView extends StatefulWidget {
  const MatchView({Key? key}) : super(key: key);

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is where you will view your matches'),
      ),
    );
  }
}
