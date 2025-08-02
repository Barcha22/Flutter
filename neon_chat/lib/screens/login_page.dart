import 'package:flutter/material.dart';
import '/animation/animated_background.dart';
import 'chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogInPage extends StatefulWidget {
  static const String id = "login_page";
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _auth = FirebaseAuth.instance;
  String? gmail;
  String? password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          "LogIn",
          style: TextStyle(
            color: Colors.white, //
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),

      //body
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                kToolbarHeight,
            child: BlueParticlesBackground(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // icon
                    Hero(
                      tag: "logo",
                      child: SizedBox(
                        height: 200,
                        child: Image(image: AssetImage('images/logo2.png')),
                      ),
                    ),

                    SizedBox(height: 50),

                    //gmail bar
                    SizedBox(
                      height: 50,
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText: "Enter your gmail", //
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onChanged: (value) {
                          gmail = value;
                        }, //
                      ),
                    ),

                    SizedBox(height: 30),

                    //password bar
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Enter your password",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30), //
                          ),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),

                    SizedBox(height: 30),

                    //login button
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            await _auth.signInWithEmailAndPassword(
                              email: gmail!,
                              password: password!,
                            );
                            if (!mounted) return; //

                            Navigator.pushNamed(context, ChatPage.id);

                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            debugPrint('an error occured');
                            if (mounted) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  icon: Icon(Icons.error, color: Colors.red),
                                  title: Text("Login Failed"),
                                  content: Text(
                                    "Incorrect email or password.",
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("OK"),
                                    ),
                                  ],
                                  contentPadding: EdgeInsets.all(10),
                                  insetPadding: EdgeInsets.symmetric(
                                    vertical: 200,
                                    horizontal: 80,
                                  ),
                                ),
                              );
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                        child: Text("Login"), //
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
