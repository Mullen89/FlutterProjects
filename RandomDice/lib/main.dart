import 'package:flutter/material.dart';
import 'dart:math';

int leftDiceBtn = 1;
int rightDiceBtn = 1;
int total = 0;
var totalColor = Colors.transparent;

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[700],
        appBar: AppBar(
          title: Text('Random Dice'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  void randFunc() {
    leftDiceBtn = Random().nextInt(6) + 1;
    rightDiceBtn = Random().nextInt(6) + 1;
    total = leftDiceBtn + rightDiceBtn;
    totalColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        randFunc();
                      });
                    },
                    child: Image.asset('images/dice$leftDiceBtn.png'),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        randFunc();
                      });
                    },
                    child: Image.asset('images/dice$rightDiceBtn.png'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$total',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 48.0,
                      color: totalColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
