import 'package:flutter/material.dart';
import 'package:paw_tindr/views/owner_view.dart';
import 'package:paw_tindr/widgets/tinder_card.dart';
import 'package:paw_tindr/views/chat_view.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import '../models/owner.dart';
import 'login_view.dart';

class HomeView extends StatefulWidget {
  final Owner user;
  const HomeView(this.user, {Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // SwipeableCardSectionController _cardController = SwipeableCardSectionController();
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SwipeableCardSectionController cardController =
        SwipeableCardSectionController();
    List<Widget> menu = <Widget>[
      OwnerView(
        widget.user,
      ),
      DefaultTabController(
        length: 1,
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
              Tab(icon: Icon(Icons.home)),
            ]),
          ),
          body: Center(
            child: Column(
              children: [
                SafeArea(
                  child: Container(
                    height: 420,
                    width: 300,
                    // color: Colors.blue,
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        // Expanded(
                        SwipeableCardsSection(
                          cardController: cardController,
                          context: context,
                          items: const [
                            TinderCard(
                              firstName: 'Travy',
                              lastName: 'Patty',
                              age: '3 months old',
                              breed: 'Chihuahua mix',
                              imagePath: 'images/p.png',
                            ),
                            TinderCard(
                              firstName: 'Firulais',
                              lastName: 'Gomez',
                              age: '2 months old',
                              breed: 'Retriever mix',
                              imagePath: 'images/puppy.png',
                            ),
                            TinderCard(
                              firstName: 'Rex',
                              lastName: 'Smith',
                              age: '2 years old',
                              breed: 'Husky',
                              imagePath: 'images/p2.jpeg',
                            ),
                            TinderCard(
                              firstName: 'Max',
                              lastName: 'Johnson',
                              age: '3 years old',
                              breed: 'Labrador',
                              imagePath: 'images/p.png',
                            ),
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
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      const ChatView(),
    ];
    return Scaffold(
      body: menu.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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
