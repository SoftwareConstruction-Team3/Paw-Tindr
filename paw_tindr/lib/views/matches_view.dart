import 'package:flutter/material.dart';
import 'package:paw_tindr/models/match.dart';

class MatchView extends StatefulWidget {
  const MatchView({Key? key}) : super(key: key);

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  final List<Widget> matches = [
    Match(),
    Match(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: matches,
          ),
        ),
      ),
    );
  }
}
