import 'package:flutter/material.dart';
import 'package:paw_tindr/widgets/tinder_card.dart';
import 'package:paw_tindr/views/profile_view.dart';
import 'package:paw_tindr/views/chat_view.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'dart:core';
// import 'package:swipeable_card_stack/swipeable_card_stack.dart';
// import 'package:swipable_stack/swipable_stack.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<SwipeItem> _swipeItems = <SwipeItem>[
    SwipeItem(
      content: TinderCard(),
      likeAction: () {
        print("liked");
      },
      nopeAction: () {
        print("dislike");
      },
      superlikeAction: () {
        print("superlike");
      },
      // onSlideUpdate: (SlideRegion? region) async {
      //   print("Region $region");
      // }
    ),
  ];
  int _selectedIndex = 1;
  MatchEngine? _matchEngine = MatchEngine(swipeItems: _swipeItems);

  // @override
  // void initState() {
  //   _swipeItems.add(SwipeItem(
  //       content: TinderCard(),
  //       likeAction: () {
  //         print("liked");
  //       },
  //       nopeAction: () {
  //         print("dislike");
  //       },
  //       superlikeAction: () {
  //        print("superlike");
  //       },
  //       // onSlideUpdate: (SlideRegion? region) async {
  //       //   print("Region $region");
  //       // }
  //     )
  //   );

  //   _matchEngine = MatchEngine(swipeItems: _swipeItems);
  //   super.initState();
  // }
  // int counter = 4;
  // card controller
  // SwipeableCardSectionController _cardController = SwipeableCardSectionController();
  // late final SwipableStackController _controller;

  // void _listenController() => setState(() {});
  
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = SwipableStackController()..addListener(_listenController);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller
  //     ..removeListener(_listenController)
  //     ..dispose();
  // }

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

  List<Widget> _menu = <Widget>[
    ProfileView(),
    Center(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 450,
              width: 300,
              // color: Colors.blue,
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/header_logo.png'),
                    width: 400.0,
                    alignment: FractionalOffset.topCenter,
                  ),
                  Expanded(
                    child: SwipeCards(
                      matchEngine: _matchEngine!,
                      itemBuilder: (BuildContext context, int index) {
                        return _swipeItems[index].content;
                      },
                      onStackFinished: () {
                        return Center(
                          child: Text('No more people'),
                        );
                      },
                    ),
                  ),
                  // _displayButtons(),
                ]
              ) 
            ),
          ),
        ],
      ),
    ),
    ChatView(),
  ];

  // Row _displayLogo() {
  //   return Row(
  //     children: [
  //       ElevatedButton(
  //         child: Icon(Icons.clear, color: Colors.red, size:),
  //         onPressed: () {
  //           print("clear")
  //         }
  //       ),
  //       ElevatedButton(
  //         child: Icon(Icons.clear, color: Colors.red, size:),
  //         onPressed: () {
  //           print("clear")
  //         }
  //       ),
  //       ElevatedButton(
  //         child: Icon(Icons.clear, color: Colors.red, size:),
  //         onPressed: () {
  //           print("clear")
  //         }
  //       ),
  //     ]
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _menu.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: "Chat"
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
          // SwipableStack(
          //   detectableSwipeDirections: const {
          //     SwipeDirection.right,
          //     SwipeDirection.left,
          //   },
          //   controller: _controller,
          //   stackClipBehaviour: Clip.none,
          //   onSwipeCompleted: (index, direction) {
          //     print('$index, $direction');
          //   },
          //   horizontalSwipeThreshold: 0.8,
          //   verticalSwipeThreshold: 0.8,
          //   builder: (context, properties) {
          //   final itemIndex = properties.index % 3;

          //   return Stack(
          //     children: [
          //       TinderCard(colorCard: Colors.red),
          //       TinderCard(colorCard: Colors.yellow),
          //       TinderCard(colorCard: Colors.blue),
          //       // more custom overlay possible than with overlayBuilder
          //       // if (properties.stackIndex == 0 &&
          //       //     properties.direction != null)
          //       //   CardOverlay(
          //       //     swipeProgress: properties.swipeProgress,
          //       //     direction: properties.direction!,
          //       //   )
          //     ],
          //   );
          // },
          //   // context: context,
          //   // items: [
          //   //   TinderCard(colorCard: Colors.red),
          //   //   TinderCard(colorCard: Colors.yellow),
          //   //   TinderCard(colorCard: Colors.blue),
          //   // ],
          //   // onCardSwiped: (dir, index, widget) {
          //   //   if(counter <= 20){
          //   //     _cardController.addItem(TinderCard(colorCard: Colors.black));
          //   //     print("on: Card ${counter}");
          //   //     counter++;
          //   //   }
          //   //   if (dir == Direction.left) {
          //   //     print('onDisliked ${(widget as TinderCard).colorCard} $index');
          //   //   } else if (dir == Direction.right) {
          //   //     print('onLiked ${(widget as TinderCard).colorCard} $index');
          //   //   } else if (dir == Direction.up) {
          //   //     print('onUp ${(widget as TinderCard).colorCard} $index');
          //   //   } else if (dir == Direction.down) {
          //   //     print('onDown ${(widget as TinderCard).colorCard} $index');
          //   //   }
          //   // }
          // ),
  }
}
