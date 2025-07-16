import 'package:flutter/material.dart';
import 'main.dart';

Color maleColorCard = inactiveColor;
Color femaleColorCard = inactiveColor;
const Color activeColor = Colors.blue;
const Color inactiveColor = Colors.grey;

void update(Genders gender) {
  //for male
  if (gender == Genders.male) {
    if (maleColorCard == inactiveColor) {
      if (femaleColorCard == activeColor) {
        femaleColorCard = inactiveColor;
      }
      maleColorCard = activeColor;
    } else {
      maleColorCard = inactiveColor;
    }
  }
  //for female
  if (gender == Genders.female) {
    if (femaleColorCard == inactiveColor) {
      femaleColorCard = activeColor;
      if (maleColorCard == activeColor) {
        maleColorCard = inactiveColor;
      }
    } else {
      femaleColorCard = inactiveColor;
    }
  }
}
