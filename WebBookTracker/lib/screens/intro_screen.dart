import 'package:book_tracker_app/util/custom_widgets.dart';
import 'package:flutter/material.dart';

import 'sign_in_screen.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.blueGrey.shade100,
            child: Column(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "BookTracker",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Text(
                  '"Read and Upgrade Yourself"',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50.0),

                // Sign-in Button. Goes to home page.
                kButtonBasicWithIcon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ));
                    },
                    buttonText: "Sign in to get started",
                    buttonIcon: Icons.login_rounded),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
