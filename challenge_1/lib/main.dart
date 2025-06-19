import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal, //
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('images/pic.jpg'), //
                ),
              ),
              Text(
                'Tom Hanks', //
                style: TextStyle(
                  fontFamily: 'Italic', //
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ), //
              Text(
                'Co-Founder at IDEA',
                style: TextStyle(
                  fontSize: 16, //
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 250,
                child: Divider(
                  thickness: 1,
                  color: Colors.grey, //
                  // indent: 25,
                  // endIndent: 25,
                ),
              ),
              Card(
                color: Colors.white,

                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.phone, //
                  ),
                  title: Text(
                    '+134834231',
                    style: TextStyle(
                      color: Colors.teal, //
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,

                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.mail, //
                  ),
                  title: Text(
                    'burnermail@hotmail.com',
                    style: TextStyle(
                      color: Colors.teal, //
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
