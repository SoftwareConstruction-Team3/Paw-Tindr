import 'package:flutter/material.dart';
import 'package:paw_tindr/views/owner_view.dart';
import 'package:paw_tindr/widgets/tinder_card.dart';
import 'package:paw_tindr/views/profile_view.dart';
import 'package:paw_tindr/views/matches_view.dart';
import 'package:paw_tindr/views/chat_view.dart';
import 'package:provider/provider.dart';
// import 'package:swipe_cards/swipe_cards.dart';
// import 'dart:core';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
// import 'package:swipable_stack/swipable_stack.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // SwipeableCardSectionController _cardController = SwipeableCardSectionController();
  int _selectedIndex = 1;

  Image displayLogo() {
    return Image(
      image: AssetImage('assets/images/header_logo.png'),
      width: 400.0,
      alignment: FractionalOffset.topCenter,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List<Widget> _menu = <Widget>[
  //   ProfileView(),
  //   Center(
  //     child: Column(
  //       children: [
  //         SafeArea(
  //           child: Container(
  //             height: 450,
  //             width: 300,
  //             // color: Colors.blue,
  //             padding: EdgeInsets.all(5),
  //             child: Column(
  //               children: [
  //                 Image(
  //                   image: AssetImage('assets/images/header_logo.png'),
  //                   width: 400.0,
  //                   alignment: FractionalOffset.topCenter,
  //                 ),
  //                 Expanded(
  //                   child: SwipeableCardsSection(
  //                     cardController: _cardController,
  //                     context: context,
  //                     items: [
  //                       TinderCard(),
  //                       TinderCard(),
  //                       TinderCard(),
  //                     ],
  //                     onCardSwiped: (dir, index, widget) {
  //                       if (dir == Direction.left) {
  //                         print('Disliked');
  //                       } else if (dir == Direction.right) {
  //                         print('Liked');
  //                       } else if (dir == Direction.up) {
  //                         print('Up');
  //                       } else if (dir == Direction.down) {
  //                         print('down');
  //                       }
  //                     },
  //                   ),
  //                 ),
  //                 // _displayButtons(),
  //               ]
  //             )
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  //   ChatView(),
  // ];

  @override
  Widget build(BuildContext context) {
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();
    List<Widget> _menu = <Widget>[
      //ProfileView(),
      //MatchView(),
      OwnerView(),
      Center(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                  height: 450,
                  width: 300,
                  // color: Colors.blue,
                  padding: EdgeInsets.all(5),
                  child: Column(children: [
                    Image(
                      image: AssetImage('assets/images/header_logo.png'),
                      width: 400.0,
                      alignment: FractionalOffset.topCenter,
                    ),
                    Expanded(
                      child: SwipeableCardsSection(
                        cardController: _cardController,
                        context: context,
                        items: [
                          TinderCard(),
                          TinderCard(),
                          TinderCard(),
                        ],
                        onCardSwiped: (dir, index, widget) {
                          if (dir == Direction.left) {
                            print('Disliked');
                          } else if (dir == Direction.right) {
                            print('Liked');
                          } else if (dir == Direction.up) {
                            print('Up');
                          } else if (dir == Direction.down) {
                            print('down');
                          }
                        },
                      ),
                    ),
                    // _displayButtons(),
                  ])),
            ),
          ],
        ),
      ),
      ChatView(),
    ];
    return Scaffold(
      body: _menu.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined), label: "Chat"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
