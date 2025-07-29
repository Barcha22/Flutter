import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '/animation/animated_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static const String id = "registration_page";
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String gmail;
  late String password1;
  late String password2;
  bool goodToGo = false;
  final _auth = FirebaseAuth.instance;
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Registration",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white, //
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white), //
        ),
      ),

      //body
      body: SingleChildScrollView(
        child: Container(
          height:
              MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              kToolbarHeight,
          child: BlueParticlesBackground(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //animated text
                  Container(
                    width: 350,
                    height: 200,
                    padding: EdgeInsets.fromLTRB(70, 80, 10, 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: 'Agne', //
                        color: Color.fromARGB(255, 5, 205, 18),
                      ),
                      child: AnimatedTextKit(
                        onTap: () {},
                        animatedTexts: [
                          TypewriterAnimatedText('         Fast'),
                          TypewriterAnimatedText('        Simple'),
                          TypewriterAnimatedText('         Fun'),
                          TypewriterAnimatedText('  Register Now!'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 70),
                  //gmail field
                  makeTextField(
                    "Enter your gmail",
                    preicon: Icon(Icons.mail),
                    onChanged: (value) {
                      setState(() {
                        gmail = value;
                      });
                    },
                    onSubmitted: (value) {}, // Add this empty callback
                  ),
                  SizedBox(height: 30),
                  //passwords field
                  makeTextField(
                    "Enter a password",
                    preicon: Icon(Icons.lock),
                    onChanged: (value) {
                      setState(() {
                        password1 = value;
                      });
                    },
                    onSubmitted: (value) {}, // Add this empty callback

                    isPassword: true,
                  ),
                  SizedBox(height: 30),
                  //password2 field
                  makeTextField(
                    "Re-enter your password",
                    preicon: Icon(Icons.lock),
                    onChanged: (value) {
                      setState(() {
                        if (value == password1) {
                          goodToGo = true;
                        } else {
                          goodToGo = false;
                        }
                      });
                    },

                    onSubmitted: (value) {
                      // password1 = value;
                    },
                    isPassword: true,
                    suficon: password1.isNotEmpty
                        ? (goodToGo
                              ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              : const Icon(Icons.warning, color: Colors.red))
                        : null,
                  ),
                  SizedBox(height: 30),
                  //register button
                  SizedBox(
                    // width: MediaQuery.of(context).size.width,//this fills the screen so i dont need this line
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          final NewUser = await _auth
                              .createUserWithEmailAndPassword(
                                email: gmail,
                                password: password1,
                              );
                          debugPrint(NewUser.user?.email ?? 'No user email');
                          Navigator.pushNamed(context, LogInPage.id);
                        } catch (e) {
                          debugPrint('Registration error: $e');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 15, //
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ), // This closes the OptimizedAnimatedBackground
          ),
        ),
      ),
    );
  }

  Widget makeTextField(
    String text, {
    Widget? preicon,
    Function(String)? onSubmitted,
    Function(String)? onChanged,
    bool isPassword = false,
    Widget? suficon,
  }) {
    return SizedBox(
      height: 50,
      width: 350,
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          suffixIcon: suficon,
          hintText: text,
          // labelText: text2,
          prefixIcon: preicon,
          filled: true,
          fillColor: Colors.white, //
        ),
        onSubmitted: onSubmitted,
        onChanged: onChanged,
      ),
    );
  }
}
