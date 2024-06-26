import 'package:flutter/material.dart';

class Case8 extends StatefulWidget {
  const Case8({super.key});

  @override
  Case8State createState() => Case8State();
}

class Case8State extends State<Case8> {
  double cardXPosition = 0.0;
  double cardYPosition = 0.0;
  double cardRotation = 0.0;
  bool isLiked = false;
  bool isDisliked = false;

  List<String> cards = List.generate(99, (index) => 'Card ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case8'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Colors.white,
        child: buildStackedCards(),
      ),
    );
  }

  Widget buildStackedCards() {
    if (cards.isEmpty) {
      return const Text(
        'No more cards',
        style: TextStyle(fontSize: 24, color: Colors.black),
      );
    }
    return Stack(
      alignment: Alignment.center,
      children: List.generate(cards.length, (index) {
        if (index == cards.length - 1) {
          return buildMainCard(index);
        } else {
          return buildCard(index, showText: true);
        }
      }),
    );
  }

  Widget buildMainCard(int index) {
    return Transform(
      transform: Matrix4.translationValues(cardXPosition, cardYPosition, 0)
        ..rotateZ(cardRotation),
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            cardXPosition += details.delta.dx;
            cardYPosition += details.delta.dy;
            cardRotation = cardXPosition / 1000;
            isLiked = cardXPosition > 80;
            isDisliked = cardXPosition < -80;
          });
        },
        onPanEnd: (_) {
          if (isLiked || isDisliked) {
            setState(() {
              if (isLiked) {
                // 喜欢
              } else {
                // 不喜欢
              }
              cards.removeAt(index);
              resetCard();
            });
          } else {
            resetCard();
          }
        },
        child: buildCard(index),
      ),
    );
  }

  Widget buildCard(int index, {bool showText = false}) {
    return Container(
      width: 240,
      height: 320,
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.white70,
            blurRadius: 5,
            spreadRadius: 0.5,
            offset: Offset(2.5, 2.5),
          ),
        ],
      ),
      child: Center(
        child: showText
            ? Text(
                cards[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            : buildCardIconOrText(index),
      ),
    );
  }

  Widget buildCardIconOrText(int index) {
    if (isLiked) {
      return Icon(
        Icons.favorite_sharp,
        color: Colors.red.withOpacity(0.8),
        size: 120,
      );
    } else if (isDisliked) {
      return Icon(
        Icons.clear,
        color: Colors.black.withOpacity(0.8),
        size: 120,
      );
    } else {
      return Text(
        cards[index],
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  void resetCard() {
    setState(() {
      cardXPosition = 0.0;
      cardYPosition = 0.0;
      cardRotation = 0.0;
      isLiked = false;
      isDisliked = false;
    });
  }
}
