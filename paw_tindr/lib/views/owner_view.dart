import 'package:flutter/material.dart';

// class Owner extends StatelessWidget {
//   const Owner({Key? key}) : super(key: key);

//   //static const String _title = 'Paw-Tindr';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       //title: _title,
//       home: OwnerView(),
//     );
//   }
// }

class OwnerView extends StatefulWidget {
  const OwnerView({Key? key}) : super(key: key);

  @override
  State<OwnerView> createState() => _OwnerViewState();
}

class _OwnerViewState extends State<OwnerView> {
  Image displayLogo() {
    return const Image(
      image: AssetImage('assets/images/header_logo.png'),
      width: 400.0,
      alignment: FractionalOffset.topCenter,
    );
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
          body: TabBarView(
            children: <Widget>[
              const Center(
                child: Text('Owner profile view'),
              ),
              ListView(
                children: petList,
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
    title: const Text('Edit User Information',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0)),
    //subtitle: const Text(''),
    leading: Icon(
      Icons.edit,
      size: 35,
      color: Colors.orangeAccent[200],
    ),
  ),
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
    title: const Text('Name',
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
      Icons.location_on_outlined,
      color: Colors.orangeAccent[200],
    ),
  ),
];

List<Widget> petList = <Widget>[
  ListTile(
    title: const Text('Pet1',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: const Text('[insert pet stuff]: '),
    leading: Icon(
      Icons.pets,
      color: Colors.orangeAccent[200],
    ),
  ),
  ListTile(
    title: const Text('Pet2',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: const Text('[insert pet stuff]: '),
    leading: Icon(
      Icons.pets,
      color: Colors.orangeAccent[200],
    ),
  ),
  ListTile(
    title: const Text('Pet3',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: const Text('[insert pet stuff]: '),
    leading: Icon(
      Icons.pets,
      color: Colors.orangeAccent[200],
    ),
  ),
  ListTile(
    title: const Text('Add Pet',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: const Text('will create button to create new profile for pet: '),
    leading: Icon(
      Icons.add_circle,
      color: Colors.orangeAccent[200],
    ),
  ),
];

// // for testing
// void main() => runApp(const OwnerView(
//       title: 'Paw-Tindr',
//     ));
