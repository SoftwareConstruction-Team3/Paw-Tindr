import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paw_tindr/models/chat.dart';

import 'message_view.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  // obtain list of chats from database
  Future<List<Chat>> getChats() async {
    List<Chat> chats = [];
    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection('Chats')
        .doc('${FirebaseAuth.instance.currentUser?.uid}')
        .get();

    document.get('chats').forEach((chat) {
      chats.add(Chat.fromMap(chat));
    });
    return chats;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent[200],
        title: //const Text('Paw-Tindr'),
            const Image(
          image: AssetImage('assets/images/header_logo.png'),
          width: 150.0,
          alignment: FractionalOffset.topCenter,
        ),
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
              if (snapshot.requireData.isEmpty) {
                return const Center(
                  child: Text('There currently are no messages.'),
                );
              }
              return _buildChatListTile(snapshot.requireData);
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
        future: getChats(),
      ),
    );
  }
}

_buildChatListTile(List<Chat> chats) {
  var msglst;
  return ListView.builder(
      itemCount: chats.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 16),
      itemBuilder: ((context, index) => SizedBox(
          height: 80,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chats[index].imageUrl),
              maxRadius: 50,
              minRadius: 30,
            ),
            title: Text(
                '${chats[index].matchFirstName} ${chats[index].matchLastName}'),
            subtitle: Text(chats[index].lastMessage),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return messagePage(chats[index]);
              }));
            },
          ))));
}

_printMsgList(msglst) {
  for (int i = 0; i < msglst.length; i++) {
    print(msglst[i].text);
  }
}
