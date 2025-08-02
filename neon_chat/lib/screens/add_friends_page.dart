import 'package:flutter/material.dart';
import '/animation/animated_background.dart';
import 'chat_page.dart';

class AddFriendsPage extends StatefulWidget {
  static const String id = "Add_friend_page";
  const AddFriendsPage({super.key});
  @override
  State<AddFriendsPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: Text("Add Friends"),
        centerTitle: true,
        backgroundColor: Colors.black, //
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),

      //body
      body: SafeArea(
        child: BlueParticlesBackground(
          child: Column(
            children: [
              //1. SearchBar
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white, //
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),

              //2. for bottom navigation toolbar
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5,
                      left: 5,
                      right: 5,

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
                                Navigator.pushNamed(context, ChatPage.id);
                              },
                              child: Icon(Icons.message),
                            ),

                            //add friends icon
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
                                  Icons.person_add,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ), //
              ),
            ],
          ), //
        ),
      ),
    );
  }
}
