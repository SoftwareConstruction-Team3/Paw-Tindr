import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/owner.dart';
import '../models/pet.dart';

final _myController = TextEditingController();

class PetListView extends StatefulWidget {
  final Owner user;
  const PetListView(this.user, {super.key});

  @override
  State<PetListView> createState() => _PetListViewState();
}

class _PetListViewState extends State<PetListView> {
  Future<Pet> getPet(String petID) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection('Pets').doc(petID).get();
    print(doc.data());

    // print(document.data().toString());
    Pet pet = Pet.fromFirestore(doc);

    return pet;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: widget.user.pets.length,
                  itemBuilder: (BuildContext context, int index) {
                    FutureBuilder(
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
                            if (snapshot.requireData != null) {
                              return const Center(
                                child: Text('No user data.'),
                              );
                            }
                            return _buildPetView(snapshot.requireData);
                          }
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                      future: getPet(widget.user.pets.elementAt(index)),
                    );
                    // ListTile(
                    //   title: Text(widget.user.pets.elementAt(index).name,
                    //       style: const TextStyle(
                    //           fontWeight: FontWeight.w500, fontSize: 20.0)),
                    //   subtitle:
                    //       Text(widget.user.pets.elementAt(index).description),
                    //   leading: Icon(
                    //     Icons.pets,
                    //     color: Colors.orangeAccent[200],
                    //   ),
                    // );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        child: const Icon(Icons.add_circle),
        onPressed: () {},
      ),
    );
  }
}

_buildPetView(Pet pet) {
  return ListTile(
    title: Text(pet.name,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text(pet.description),
    leading: Icon(
      Icons.pets,
      color: Colors.orangeAccent[200],
    ),
  );
}
