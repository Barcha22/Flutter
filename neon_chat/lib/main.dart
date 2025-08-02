import 'package:flash_chat/screens/add_friends_page.dart';
import 'package:flutter/material.dart';
import '/screens/welcome_page.dart';
import '/screens/login_page.dart';
import '/screens/registration.dart';
import '/screens/chat_page.dart';
// import 'screens/add_friends_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const NeonChat());
}

class NeonChat extends StatelessWidget {
  const NeonChat({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Welcome.id,
      routes: {
        Welcome.id: (context) => Welcome(), //
        LogInPage.id: (context) => LogInPage(),
        Register.id: (context) => Register(),
        ChatPage.id: (context) => ChatPage(),
        AddFriendsPage.id: (context) => AddFriendsPage(),
      },
    );
  }
}


//to- do
/*
  1. implement search bar 
  2. make a profile page
  3. make a setting page
  4. use email verification from firebase auth
  5. optimize app
*/