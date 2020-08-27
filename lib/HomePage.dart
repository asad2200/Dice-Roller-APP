import "package:flutter/material.dart";
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage one = AssetImage("images/one.png");
  AssetImage two = AssetImage("images/two.png");
  AssetImage three = AssetImage("images/three.png");
  AssetImage four = AssetImage("images/four.png");
  AssetImage five = AssetImage("images/five.png");
  AssetImage six = AssetImage("images/six.png");

  AssetImage diceImage;

  @override
  void initState() {
    super.initState();
    diceImage = one;
  }

  void rollDice() {
    int rndom = 1 + (Random().nextInt(6));
    AssetImage tmpImg;
    switch (rndom) {
      case 1:
        tmpImg = one;
        break;
      case 2:
        tmpImg = two;
        break;
      case 3:
        tmpImg = three;
        break;
      case 4:
        tmpImg = four;
        break;
      case 5:
        tmpImg = five;
        break;
      case 6:
        tmpImg = six;
        break;
    }
    setState(() {
      diceImage = tmpImg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dice Roller",
          style: TextStyle(
            color: Color(0xFF3d321c),
            fontSize: 25.0,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF7971E),
              Color(0xFFFFD200),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                transform: Matrix4.rotationZ(0.05),
                child: Image(
                  image: diceImage,
                  width: 300.0,
                  height: 300.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(40.0, 25.0, 40.0, 25.0),
                  color: Color(0xFFf68d15),
                  child: Text(
                    "🎲 Roll 🎲",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color(0xFF3d321c),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  onPressed: rollDice,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
