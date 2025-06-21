import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 97, 134, 255), //
        appBar: AppBar(
          elevation: 4, //
          title: Center(
            child: Text(
              'Ask Me Anything', //
              style: TextStyle(
                color: Colors.white, //
                fontSize: 40,
              ),
            ),
          ), //
          backgroundColor: const Color.fromARGB(255, 17, 71, 159),
        ),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int img = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              ChangePic();
            });
          },
          child: Image.asset('images/ball$img.png'), //
        ),
      ],
    );
  }

  void ChangePic() {
    img = Random().nextInt(5) + 1;
  }
}
