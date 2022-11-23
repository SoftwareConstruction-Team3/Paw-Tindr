import 'package:flutter/material.dart';
import 'package:paw_tindr/models/owner.dart';
import 'package:paw_tindr/models/match.dart';

class MatchView extends StatefulWidget {
  const MatchView({Key? key}) : super(key: key);

  @override
  State<MatchView> createState() => _MatchViewState();
}

Widget _buildMatch(Match m) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      color: const Color.fromARGB(255, 243, 144, 5),
      child: ListTile(
        contentPadding: EdgeInsets.all(5),
        dense: true,
        // Below is where the behavior involving tapping your matches can be implemented
        // onTap: () async {
        //   if (await canLaunch(relatedChat)) {
        //     await launch(relatedChat);
        //   } else {
        //     throw 'Could not open designated chat';
        //   }
        // }
        // leading: m.otherOwnerProfilePic; // This is where the other pet owner's picture would go
        title: Text(
          m.otherOwnerUserName,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(m.otherPetID),
        trailing: Icon(Icons.check_box_outline_blank),
      ),
    ),
  );
}

class _MatchViewState extends State<MatchView> {
  final List<Match> matches = [
    Match(),
    Match(),
    Match(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches for firstName'),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: matches.map(_buildMatch).toList(),
          ),
        ),
      ),
    );
  }
}
