import 'package:flutter/material.dart';
import '../models/owner.dart';

final _myController = TextEditingController();

class PetListView extends StatefulWidget {
  final Owner user;
  const PetListView(this.user, {super.key});

  @override
  State<PetListView> createState() => _PetListViewState();
}

class _PetListViewState extends State<PetListView> {
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
                    ListTile(
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
