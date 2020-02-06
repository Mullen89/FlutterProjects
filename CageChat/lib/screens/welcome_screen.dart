import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
//  AnimationController controller;
//  AnimationController bcgTweenController;
//  Animation animation;
//  Animation bcgTweenAnimation;

//  @override
//  void initState() {
//    super.initState();
//    controller = AnimationController(
//      duration: Duration(seconds: 1),
//      vsync: this,
//    );
//    bcgTweenController = AnimationController(
//      duration: Duration(seconds: 1),
//      vsync: this,
//    );

//    bcgTweenAnimation = ColorTween(begin: Colors.black, end: Colors.white)
//        .animate(bcgTweenController);
//    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
//
//    controller.forward();
//    controller.addListener(() {
//      setState(() {});
//    });
//    bcgTweenController.forward();
//    bcgTweenController.addListener(() {
//      setState(() {});
//    });
//  }

//  @override
//  void dispose() {
//    /**
//     * Needed so controller does not hog resources.
//     */
//    controller.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/chatcage.png'), fit: BoxFit.fill),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                //   Flexible(
                //      child: Hero(
                //        tag: 'logo',
//                    child: Container(
//                      child: Image.asset(
//                        'images/cage.png',
//                        width: 30.0,
//                        height: 30.0,
//                      ),
//                      // height: 60.0,
//                    ),
                //   ),
                //   ),
//                ColorizeAnimatedTextKit(
//                  text: ['Cage Chat'],
//                  textStyle: TextStyle(
//                    fontSize: 50.0,
//                    fontWeight: FontWeight.w900,
//                  ),
//                  colors: [
//                    Colors.black,
//                    Colors.blue[900],
//                    Colors.yellow,
//                    Colors.blue,
////                    Colors.yellow,
////                    Colors.green,
////                    Colors.blue[900],
////                    Colors.purple,
//                  ],
//                  totalRepeatCount: 1.0,
//                  speed: Duration(milliseconds: 200),
//                ),
              ],
            ),
            SizedBox(
              height: 280.0,
            ),
            CustomButton(
              title: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, '/l');
              },
            ),
            CustomButton(
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, '/r');
              },
            ),
          ],
        ),
      ),
    );
  }
}
