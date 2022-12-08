import 'package:flutter/material.dart';
import 'package:paw_tindr/views/matches_view.dart';
/*
class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is where you will view your chats'),
      ),
    );
  }
}
*/
class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
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
        length: 2,
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
              //Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.message)),
              Tab(icon: Icon(Icons.add_reaction_sharp)),
              //Tab(icon: Icon(Icons.settings)),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              ListTile(
                title: const Text('Daisy',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
              subtitle: const Text('Hello how are you?'),
              leading: Icon(
                Icons.message,
                color: Colors.orangeAccent[200],
                ),
              ),
              const MatchView(),
            ],
          ),
        ),
      ),
    );
  }
}
