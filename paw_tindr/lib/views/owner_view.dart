import 'package:flutter/material.dart';
import 'package:paw_tindr/views/app_settings_view.dart';
import 'package:paw_tindr/views/pets_list_view.dart';
import 'app_settings_view.dart';
import '../models/owner.dart';
import 'profile_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _myController = TextEditingController();

class OwnerView extends StatefulWidget {
  const OwnerView({super.key});

  @override
  State<OwnerView> createState() => _OwnerViewState();
}

class _OwnerViewState extends State<OwnerView> {
  Future<Owner> getOwner() async {
    DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection('Owners')
        .doc('${FirebaseAuth.instance.currentUser?.uid}')
        .get();
    Owner user = Owner.fromFirestore(doc);

    return user;
  }

  @override
  void initState() {
    super.initState();
  }

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
          body: FutureBuilder(
            builder: (context, snapshot) {
              // Checking if future is resolved
              if (snapshot.connectionState == ConnectionState.done) {
                // If we got an error
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      '${snapshot.error} occurred',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );

                  // if we got our data
                } else if (snapshot.hasData) {
                  // Extracting data from snapshot object
                  if (snapshot.requireData == null) {
                    return const Center(
                      child: Text('No user data.'),
                    );
                  }
                  return _buildOwnerView(snapshot.requireData);
                }
              }
              return const Center(child: CircularProgressIndicator());
            },
            future: getOwner(),
          ),
        ),
      ),
    );
  }
}

_buildOwnerView(Owner user) {
  return TabBarView(
    children: <Widget>[
      ProfileView(user),
      PetListView(user),
      // ListView.builder(
      //     itemCount: user.pets.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return ListTile(
      //         title: Text(user.pets.elementAt(index),
      //             style: const TextStyle(
      //                 fontWeight: FontWeight.w500, fontSize: 20.0)),
      //         subtitle: Text(user.pets.elementAt(index)),
      //         leading: Icon(
      //           Icons.pets,
      //           color: Colors.orangeAccent[200],
      //         ),
      //       );
      //     }),
      AppSettings(user),
    ],
  );
}
