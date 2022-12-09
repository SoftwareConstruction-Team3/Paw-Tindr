import 'package:flutter/material.dart';
import 'package:paw_tindr/models/chat.dart';
import 'package:paw_tindr/models/message.dart';
import 'package:paw_tindr/views/owner_view.dart';

import 'messege_view.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<Chat> chats = [];

  @override
  void initState() {
    // TODO: implement initState
    Message message1 =
        Message(123456789, true, false, '1234567', 'THIS IS A TEST 1');
    Message message2 = Message(
        123456789, true, true, '1234567', 'sounds interesting lets meet up');
    List<Message> messageList = [];
    messageList.add(message1);
    messageList.add(message2);

    String lastMessege = message2.text;
    Chat chat1 = Chat(
        'Steve',
        'Ramos',
        '12345678',
        'Effrian',
        'Retaena',
        'sounds interesting lets meet up',
        'https://i.natgeofe.com/n/4f5aaece-3300-41a4-b2a8-ed2708a0a27c/domestic-dog_thumb_4x3.jpg',
        messageList);
    Chat chat2 = Chat(
        'Steve',
        'Ramos',
        '12345678',
        'Santa',
        'Clause',
        'Have a Merry Christmas',
        'https://thumbs.dreamstime.com/b/beautiful-happy-reddish-havanese-puppy-dog-sitting-frontal-looking-camera-isolated-white-background-46868560.jpg',
        messageList);
    Chat chat3 = Chat(
        'Steve',
        'Ramos',
        '12345678',
        'Luke',
        'SkyWalker',
        'May The Force Be with you',
        'https://thehappypuppysite.com/wp-content/uploads/2015/09/The-Siberian-Husky-HP-long.jpg',
        messageList);

    Chat chat4 = Chat(
        'Steve',
        'Ramos',
        '12345678',
        'Spongebob',
        'Squarepants',
        'Want a Krabby patty?',
        'https://assets.entrepreneur.com/content/3x2/2000/20180521195827-gary-spongebob.jpeg',
        messageList);

    chats.add(chat1);
    chats.add(chat2);
    chats.add(chat3);
    chats.add(chat4);
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
      body: _buildChatListTile(chats),
    );
  }
}

_buildChatListTile(List<Chat> chats) {
  var msglst;
  return ListView.builder(
      itemCount: chats.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 16),
      itemBuilder: ((context, index) => Container(
          height: 80,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chats[index].imageurl),
              maxRadius: 50,
              minRadius: 30,
            ),
            title: Text(
                chats[index].matchFirstName + ' ' + chats[index].matchLastName),
            subtitle: Text(chats[index].lastMessege),
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
