import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  const ReuseableCard({
    this.cardChild,
    this.colour,
    super.key,
  }); //a customized constructor

  final Color? colour;

  final Widget?
  cardChild; //this is an object that will have accept any widgets as child

  @override
  Widget build(BuildContext context) {
    return Container(
      //
      margin: EdgeInsets.all(15), //
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25), //
        color: colour, //
      ),
      child: cardChild,
    );
  }
}
