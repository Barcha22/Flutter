import 'package:flutter/material.dart';
import '/animation/animated_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'add_friends_page.dart';
import 'welcome_page.dart';

class ChatPage extends StatefulWidget {
  static const String id = "Chat_Page";
  const ChatPage({super.key});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  //initstate function
  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  //function ot get current user
  void getCurrentUser() async {
    //
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      debugPrint('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer
      drawer: openBar(),
      //appbar
      appBar: AppBar(
        title: Text('Chat', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ), //to make the drawes icon white
      ),

      body: SafeArea(
        child: BlueParticlesBackground(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //1. Text field at the top
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 2, //
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                          hintText: 'Type your message here...',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48.0, // Set your desired height here
                      child: TextButton(
                        onPressed: () {
                          //Implement send functionality.
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          minimumSize: Size(60, 48), // width, height
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),

                        child: Text(
                          'Send',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //2.app bar at the bottom
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5,
                      left: 5,
                      right: 5,
                      // top: 660,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, //
                          borderRadius: BorderRadius.circular(25),
                        ),
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //messages icon
                            GestureDetector(
                              onTap: () {
                                //
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.1),
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  Icons.message,
                                  color: Colors
                                      .blue, // Blue icon for selected state
                                ),
                              ),
                            ),
                            //add friends icon
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, AddFriendsPage.id);
                              },
                              child: Icon(Icons.person_add),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ), //
              ),
            ],
          ),
        ),
      ),
    );
  }

  //function for navigation drawer
  Widget openBar() {
    return NavigationDrawer(
      // indicatorColor: Colors.blue,
      backgroundColor: Colors.black,

      children: [
        //profile
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.person_2),
              Text('Profile'), //
            ],
          ),
        ),
        //setting
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.settings),
              Text('Setting'), //
            ],
          ),
        ),
        //logout
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Are you sure"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        _auth.signOut();
                        Navigator.pushNamed(context, Welcome.id);
                      },
                      child: Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('No'),
                    ),
                  ],
                );
              },
            );
          },
          child: Row(
            children: [
              Icon(Icons.settings),
              Text('Log out'), //
            ],
          ),
        ),
      ],
    );
  }
}
