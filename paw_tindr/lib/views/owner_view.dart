import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'package:paw_tindr/views/login_view.dart';
import 'package:paw_tindr/views/app_settings_view.dart';
import '../models/pet.dart';
import 'app_settings_view.dart';
import 'login_view.dart';
import '../models/owner.dart';
import 'profile_view.dart';

final _myController = TextEditingController();

class OwnerView extends StatefulWidget {
  final Owner user;
  const OwnerView(this.user, {super.key});

  @override
  State<OwnerView> createState() => _OwnerViewState();
}

class _OwnerViewState extends State<OwnerView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent[200],
            title: //const Text('Paw-Tindr'),
                const Image(
              image: AssetImage('assets/images/header_logo.png'),
              width: 150.0,
              alignment: FractionalOffset.topCenter,
            ),
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.pets_sharp)),
              Tab(icon: Icon(Icons.settings)),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              ProfileView(widget.user),
              ListView.builder(
                  itemCount: widget.user.pets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(widget.user.pets.elementAt(index).name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.0)),
                      subtitle:
                          Text(widget.user.pets.elementAt(index).description),
                      leading: Icon(
                        Icons.pets,
                        color: Colors.orangeAccent[200],
                      ),
                    );
                  }),
              // petList,
              AppSettings(widget.user),
              // ListView(
              //   children: list,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  Pet pet = Pet.registration('Chuck', 'breed', 'Chuck', 'Dey', 'cute', {});
  Pet pet2 = Pet.registration('Amy', 'breed', 'Amy', 'Dey', 'feisty', {});
  Pet pet3 = Pet.registration('Hal', 'breed', 'Hal', 'Dey', 'wild', {});
  Owner user = Owner.details('suerh2i3urbf', 'Deyanira', 'Ochoa', 'dochoa',
      'password', '12 / 25 / 1994', '79 test st', '79932', [pet, pet2, pet3]);
  initSettings();
  runApp(OwnerView(user));
}

void initSettings() async {
  await Settings.init();
  return;
}
