import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/util/custom_widgets.dart';
import 'package:flutter_web_portfolio/util/networking.dart';
import 'package:url_launcher/url_launcher.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.black,
              foregroundImage: AssetImage('profile_pic.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Eric Mullen",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: contactButton(
              buttonText: "Contact Me",
              buttonIcon: Icon(Icons.send_sharp),
              onPressed: () => {launch(emailLaunchUri.toString())},
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Body(),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: SizedBox(height: 40, child: SocialMediaRow()),
              )),
        ],
      ),
    );
  }
}
