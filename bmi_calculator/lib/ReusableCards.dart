import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({this.cardChild, this.colour}); //a customized constructor

  final Color? colour;

  final Widget?
  cardChild; //this is an object that will have accept any widgets as child

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild, //
      margin: EdgeInsets.all(15), //
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25), //
        color: colour, //
      ),
    );
  }
}
