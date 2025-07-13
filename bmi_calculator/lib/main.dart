import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_cards.dart';
import 'child_content.dart';
import 'toggle_male_female.dart';

void main() {
  runApp(const BMICalculator());
}

//colors that shows if a card is pressed or not()
const inactiveColor = Color(0xFF1B1C2C);
const activeColor = Color(0xFF111328);
// initial colors
Color maleColorCard = inactiveColor;
Color femaleColorCard = inactiveColor;

//enumeration for male and female
enum Genders { male, female }

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(), //
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 40;
  int age = 10;
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
                      update(Genders.male);
                    });
                  }, //
                  child: ReuseableCard(
                    colour: maleColorCard, //
                    cardChild: ChildContent(
                      icon: FontAwesomeIcons.mars, //
                      label: "MALE",
                      colourIcon: Colors.blue,
                    ),
                  ),
                ),
              ),
              //female
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      update(Genders.female);
                    });
                  },
                  child: ReuseableCard(
                    colour: femaleColorCard,
                    cardChild: ChildContent(
                      label: "FEMALE",
                      icon: FontAwesomeIcons.venus, //
                      colourIcon: Colors.pinkAccent,
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
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), //
              color: Color(0xFF1B1C2C),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, //

              children: [
                Text(
                  "HEIGHT",
                  style: TextStyle(
                    fontSize: 20, //
                    color: Color(0xFF616272),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center, //
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, //
                      ),
                    ),
                    Text(
                      "cm",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF616272), //
                      ),
                    ),
                  ],
                ),

                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15,
                    ), //enlarges the thumb shape
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 30,
                    ), //gives an overlay to the thumb
                  ),
                  child: Slider(
                    value: height.toDouble(), //
                    min: 120,
                    max: 250,
                    divisions: 250 - 120,
                    activeColor: Colors.white70,
                    // label: '$height',
                    onChanged: (double newvalue) {
                      // debugPrint(newvalue.toString());
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ), //
          //Bottom two rows
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  colour: Color(0xFF1B1C2C), //
                  cardChild: Column(
                    children: [
                      Text(
                        "WEIGHT",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF616272), //
                        ),
                      ), //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: TextStyle(
                              fontSize: 50, //
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "kg",
                            style: TextStyle(
                              fontSize: 20, //
                              color: Color(0xFF606271),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: FloatingActionButton(
                                backgroundColor: Color(0xFF5DFDD4), //
                                onPressed: () {
                                  setState(() {
                                    if (weight <= 40) {
                                      debugPrint("Do Nothing");
                                    } else {
                                      weight--;
                                    }
                                  });
                                }, //
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40), //
                                ),
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ),
                          //========================
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(15), //
                              child: FloatingActionButton(
                                backgroundColor: Color(0xFF5DFDD4), //
                                onPressed: () {
                                  setState(() {
                                    if (weight <= 200) {
                                      weight++;
                                    }
                                  });
                                }, //
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40), //
                                ),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //second one
              Expanded(
                child: ReuseableCard(
                  colour: Color(0xFF1B1C2C), //
                  cardChild: Column(
                    children: [
                      Text(
                        "AGE",
                        style: TextStyle(
                          fontSize: 20, //
                          color: Color(0xFF616272),
                        ),
                      ), //
                      Text(
                        age.toString(),
                        style: TextStyle(
                          fontSize: 50, //
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: FloatingActionButton(
                                backgroundColor: Color(0xFF5DFDD4), //
                                onPressed: () {
                                  setState(() {
                                    if (age <= 10) {
                                      debugPrint("Do Nothing");
                                    } else {
                                      age--;
                                    }
                                  });
                                }, //
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40), //
                                ),
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ),
                          //========================
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(15), //
                              child: FloatingActionButton(
                                backgroundColor: Color(0xFF5DFDD4), //
                                onPressed: () {
                                  setState(() {
                                    if (age <= 110) {
                                      age++;
                                    }
                                  });
                                }, //
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40), //
                                ),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //
            ],
          ),
          Container(
            color: Colors.greenAccent,
            width: double.infinity, //
            height: 80,
            child: TextButton(
              child: Text(
                "Calculate Your BMI",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold, //
                  color: Colors.black,
                ),
              ), //
              onPressed: () {
                debugPrint("button Pressed");
              },
            ),
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
    );
  }
}
