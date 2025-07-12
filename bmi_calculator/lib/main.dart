import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCards.dart';
import 'childContent_1.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(), //
    );
  }
}

//colors that shows if a card is pressed or not()
const inactiveColor = Color(0xFF1B1C2C);
const activeColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // initial colors
  Color maleColorCard = inactiveColor;
  Color femaleColorCard = inactiveColor;

  //function to update colors of cards when pressed upon
  void update(int gender) {
    //for male
    if (gender == 1) {
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
    if (gender == 2) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background color of the page
      backgroundColor: Color(0xFF0F101D), //
      // Body of the page
      body: Column(
        children: <Widget>[
          //Top two rows
          Row(
            children: <Widget>[
              //male
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      update(1);
                    });
                  }, //
                  child: ReuseableCard(
                    colour: maleColorCard, //
                    cardChild: ChildContent(
                      icon: FontAwesomeIcons.mars, //
                      label: "MALE",
                    ),
                  ),
                ),
              ),
              //female
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      update(2);
                    });
                  },
                  child: ReuseableCard(
                    colour: femaleColorCard,
                    cardChild: ChildContent(
                      label: "FEMALE",
                      icon: FontAwesomeIcons.venus, //
                    ),
                  ),
                ),
              ),
            ],
          ),
          //Middle Container
          Container(
            margin: EdgeInsets.all(15), //
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), //
              color: Color(0xFF1B1C2C),
            ),
          ), //
          //Bottom two rows
          Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  colour: Color(0xFF1B1C2C), //
                ),
              ),
              //second one
              Expanded(
                child: ReuseableCard(
                  colour: Color(0xFF1B1C2C), //
                ),
              ),
              //
            ],
          ),
        ],
      ),
      //Top app bar of the page
      appBar: AppBar(
        backgroundColor: Color(0xFF0D101F), //
        title: Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(
              fontSize: 25, //
              fontWeight: FontWeight.bold,
              color: Colors.white, //
            ),
          ), //
        ), //
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), //Height of the line
          child: Container(
            color: Color(0xFF1A1E2D), //
            height: 1.0,
          ),
        ),
      ),
      //floating button at the leftbottom of the page(Currently not in use)
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF5DFDD4), //
        onPressed: () {}, //
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40), //
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
