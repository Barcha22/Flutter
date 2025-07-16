import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_cards.dart';
import 'child_content.dart';
import 'result_screen.dart';

void main() {
  runApp(const BMICalculator());
}

//colors that shows if a card is pressed or not()
const inactiveColor = Color(0xFF1B1C2C);
const activeColor = Color(0xFF111328);

//enumeration for male and female
enum Genders { male, female }

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => InputPage(),
      //   '/result': (context) {
      //     final args = ModalRoute.of(context)!.settings.arguments as double;
      //     return ResultScreen(bmiResult: args);
      //   },
      // },
      home: InputPage(),
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
  dynamic result;
  dynamic catchNum;

  // initial colors
  Color maleColorCard = inactiveColor;
  Color femaleColorCard = inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F101D),
      appBar: AppBar(
        backgroundColor: Color(0xFF0D101F),
        title: Center(
          child: Text("BMI Calculator", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Column(
        children: <Widget>[
          // Gender selection row
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      update(Genders.male);
                    });
                  },
                  child: ReuseableCard(
                    colour: maleColorCard,
                    cardChild: ChildContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                      colourIcon: Colors.blue,
                    ),
                  ),
                ),
              ),
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
                      icon: FontAwesomeIcons.venus,
                      colourIcon: Colors.pinkAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Height slider
          Container(
            margin: EdgeInsets.all(15),
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFF1B1C2C),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: TextStyle(fontSize: 20, color: Color(0xFF616272)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "cm",
                      style: TextStyle(fontSize: 20, color: Color(0xFF616272)),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 250,
                    divisions: 250 - 120,
                    activeColor: Colors.white70,
                    onChanged: (double newvalue) {
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          // Weight and Age row
          Row(
            children: <Widget>[
              // Weight card
              Expanded(
                child: ReuseableCard(
                  colour: Color(0xFF1B1C2C),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF616272),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "kg",
                            style: TextStyle(
                              fontSize: 20,
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
                                heroTag: null,
                                backgroundColor: Color(0xFF5DFDD4),
                                onPressed: () {
                                  setState(() {
                                    if (weight > 1) weight--;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: FloatingActionButton(
                                heroTag: null,
                                backgroundColor: Color(0xFF5DFDD4),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
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
              // Age card
              Expanded(
                child: ReuseableCard(
                  colour: Color(0xFF1B1C2C),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF616272),
                        ),
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: FloatingActionButton(
                                heroTag: null,
                                backgroundColor: Color(0xFF5DFDD4),
                                onPressed: () {
                                  setState(() {
                                    if (age > 1) age--;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: FloatingActionButton(
                                heroTag: null,
                                backgroundColor: Color(0xFF5DFDD4),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
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
            ],
          ),
          // Calculate button
          Container(
            color: Colors.greenAccent,
            width: double.infinity,
            height: 80,
            child: TextButton(
              onPressed: () {
                try {
                  double bmiValue = results();
                  print('Navigating with BMI: $bmiValue');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(bmiResult: bmiValue),
                    ),
                  );
                } catch (e) {
                  print('Navigation error: $e');
                }
              },
              child: Text(
                'CALCULATE BMI',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void update(Genders gender) {
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
    if (gender == Genders.female) {
      if (femaleColorCard == inactiveColor) {
        if (maleColorCard == activeColor) {
          maleColorCard = inactiveColor;
        }
        femaleColorCard = activeColor;
      } else {
        femaleColorCard = inactiveColor;
      }
    }
  }

  double results() {
    return weight / ((height / 100) * (height / 100));
  }
}
