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
  int leftButtonNumber = 1;
  int rightButtonNumber = 1;

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
                  leftButtonNumber = Random().nextInt(6) + 1;
                });
              },
              child: Image.asset('images/dice$leftButtonNumber.png'),
            ), //
          ),
          Expanded(
            child: TextButton(
              // style: TextButton.styleFrom(padding: EdgeInsets.zero), //we use this line if we want the padding to be vanished
              onPressed: () {
                setState(() {
                  rightButtonNumber = Random().nextInt(6) + 1;
                });
              },
              child: Image.asset('images/dice$rightButtonNumber.png'), //
            ), //
          ),
        ],
      ),
    );
  }
}
