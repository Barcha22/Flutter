import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dice App'), //
          centerTitle: true,
          backgroundColor: Colors.red,
        ),

        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceNumber = 1;
  int dicenum = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  ChangeDice();
                });
              },
              child: Image.asset('images/dice$diceNumber.png'),
            ), //
          ),
          Expanded(
            child: TextButton(
              // style: TextButton.styleFrom(padding: EdgeInsets.zero), //we use this line if we want the padding to be vanished
              onPressed: () {
                setState(() {
                  ChangeDice();
                });
              },
              child: Image.asset('images/dice$dicenum.png'), //
            ), //
          ),
        ],
      ),
    );
  }

  void ChangeDice() {
    diceNumber = Random().nextInt(6) + 1;
    dicenum = Random().nextInt(6) + 1;
  }
}
