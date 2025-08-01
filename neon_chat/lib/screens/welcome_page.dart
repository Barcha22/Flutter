import 'package:flutter/material.dart';
import '/screens/login_page.dart';
import '/screens/registration.dart';
import '/animation/animated_background.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});
  static const String id = "welcome_page";
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  late AnimationController controller; //for custom animation's controlling
  late Animation animation; //for curves

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      //make an instance or object of animationcontroller
      duration: Duration(seconds: 1),
      vsync: this, //
    );
    //this layer will apply at the top of controller animation
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.forward(); //tell it to move forward
    controller.addListener(() {
      //this will give us access to values going forward from 0 to 1
      setState(() {
        // debugPrint(controller.value.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueParticlesBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //flash icon
                  Hero(
                    tag: "logo",
                    child: SizedBox(
                      height: controller.value * 100,
                      width: 120,
                      child: Image(
                        image: AssetImage('images/logo2.png'), //
                        // fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // SizedBox(width: 15),
                  //text
                  Text(
                    'Neon Chat',
                    style: TextStyle(
                      fontSize: 30, //
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 60),

              //login button
              SizedBox(
                width: 370,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LogInPage.id);
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, //
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Login'), //
                ),
              ),

              SizedBox(height: 30),

              //registration button
              SizedBox(
                width: 370,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Register.id);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Register'), //
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
