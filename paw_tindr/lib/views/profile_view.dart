import 'package:flutter/material.dart';

import '../models/owner.dart';

class ProfileView extends StatefulWidget {
  final Owner user;
  const ProfileView(this.user, {super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is where you will view your profile'),
      ),
    );
  }
}
