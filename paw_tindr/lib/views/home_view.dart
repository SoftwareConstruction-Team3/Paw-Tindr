import 'package:flutter/material.dart';
import 'package:paw_tindr/widgets/tinder_card.dart';
// import 'package:swipeable_card_stack/swipeable_card_stack.dart';
// import 'package:swipable_stack/swipable_stack.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Container(
              height: 599,
              width: 300,
              // color: Colors.blue,
              padding: EdgeInsets.all(16),
              child: TinderCard(),
            ),
          ),
        ],
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
