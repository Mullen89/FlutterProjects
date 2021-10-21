import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/util/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class contactButton extends StatelessWidget {
  final String buttonText;
  final Widget buttonIcon;
  final void Function() onPressed;

  const contactButton(
      {required this.buttonText,
      required this.buttonIcon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        side: BorderSide(color: Colors.black, width: 1.0),
        backgroundColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        shadowColor: Colors.black,
        elevation: 2.0,
      ),
      onPressed: onPressed,
      icon: buttonIcon,
      label: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 8.0),
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LeftPage(),
        RightPage(),
      ],
    );
  }
}

class LeftPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Image.asset("body_profile.png"),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "I\'m Eric, \nA Software Engineer \nand Fitness Trainer.",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 44.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.only(left: 22.3, bottom: 8.0),
              child: Text(
                "Projects",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: ListView.builder(
                  itemCount: projectsArray.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Card(
                            elevation: 3.0,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.work),
                                  title: Text(projectsArray[index]['title']),
                                  subtitle:
                                      Text(projectsArray[index]['subtitle']),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Image.network(
                                      projectsArray[index]['image']),
                                ),
                                SizedBox(
                                  height: 50.0,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7.0,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SocialMediaRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton.icon(
              onPressed: () => {launch('https://www.facebook.com')},
              icon:
                  Image.asset('social/facebook.png', width: 25.0, height: 25.0),
              label: Text('')),
          TextButton.icon(
              onPressed: () => {launch('https://www.instagram.com')},
              icon: Image.asset('social/instagram.png',
                  width: 25.0, height: 25.0),
              label: Text('')),
          TextButton.icon(
              onPressed: () => {launch('https://www.twitter.com')},
              icon:
                  Image.asset('social/twitter.png', width: 25.0, height: 25.0),
              label: Text(''))
        ],
      ),
    );
  }
}
