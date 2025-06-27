import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(), //
      home: Destiny(),
    ),
  );
}

class Destiny extends StatefulWidget {
  const Destiny({super.key});
  @override
  State<Destiny> createState() => _DestinyState();
}

class _DestinyState extends State<Destiny> {
  StoryBrain stories = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover, //
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    stories.getStory(),
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ), //
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (stories.getchoice1() == 'Restart') {
                        stories.restart();
                      } else {
                        stories.nextStory(1);
                      }
                    });
                  }, //
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red, //
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50), //
                  ),
                  child: Text(
                    stories.getchoice1(),
                    style: TextStyle(
                      fontSize: 20, //
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      stories.nextStory(2);
                    });
                  }, //
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50), //
                  ),
                  child: Text(
                    stories.getchoice2(),
                    style: TextStyle(
                      fontSize: 20, //
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
