import 'package:flutter/material.dart';

class Owner extends StatelessWidget {
  const Owner({Key? key}) : super(key: key);

  //static const String _title = 'Paw-Tindr';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //title: _title,
      home: OwnerView(
        title: 'Paw-Tindr',
      ),
    );
  }
}

class OwnerView extends StatefulWidget {
  const OwnerView({Key? key, required String title}) : super(key: key);

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
            title: const Text('Paw-Tindr'),
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.chat)),
              Tab(icon: Icon(Icons.pets_sharp)),
              Tab(icon: Icon(Icons.person)),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              const Center(
                child: Text('chats'), //Text("Chats"),
              ),
              const Center(
                child: Text('match'), //Text("Pets"),
              ),
              ListView(
                children: list,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> list = <Widget>[
  ListTile(
    title: const Text('Username',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: const Text('[insert username]: '),
    leading: Icon(
      Icons.person_outline,
      color: Colors.orangeAccent[200],
    ),
  ),
  ListTile(
    title: const Text('Email',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: const Text('[insert email]: '),
    leading: Icon(
      Icons.email_rounded,
      color: Colors.orangeAccent[200],
    ),
  ),
  ListTile(
    title: const Text('Owner Name',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: const Text('[insert name]: '),
    leading: Icon(
      Icons.person_outline,
      color: Colors.orangeAccent[200],
    ),
  ),
  ListTile(
    title: const Text('Address',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: const Text('[insert address]: '),
    leading: Icon(
      Icons.home,
      color: Colors.orangeAccent[200],
    ),
  ),
  ListTile(
    title: const Text('Zip Code',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: const Text('[insert zip]: '),
    leading: Icon(
      Icons.map_outlined,
      color: Colors.orangeAccent[200],
    ),
  ),
  ListTile(
    title: const Text('Pet',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: const Text('[insert pet stuff]: '),
    leading: Icon(
      Icons.pets,
      color: Colors.orangeAccent[200],
    ),
  ),
];

// // for testing
// void main() => runApp(const OwnerView(
//       title: 'Paw-Tindr',
//     ));
