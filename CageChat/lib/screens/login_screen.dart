import 'package:flash_chat/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:audioplayers/audio_cache.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  int soundCount = 1;

  void playSound() {
    final player = AudioCache();
    switch (soundCount) {
      case 1:
        player.play('cage1.mp3');
        soundCount++;
        break;
      case 2:
        player.play('cage2.mp3');
        soundCount++;
        break;
      case 3:
        player.play('cage3.mp3');
        soundCount++;
        break;
      case 4:
        player.play('cage4.mp3');
        soundCount++;
        break;
      case 5:
        player.play('cage5.mp3');
        soundCount++;
        break;
      case 6:
        player.play('cage6.mp3');
        soundCount++;
        break;
      case 7:
        player.play('cage7.mp3');
        soundCount++;
        break;
      case 8:
        player.play('cage8.wav');
        soundCount = 1;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                //   child: Hero(
                //    tag: 'logo',
                child: Container(
                  height: 150.0,
                  child: FlatButton(
                    child: Image.asset('images/cage.png'),
                    onPressed: () {
                      playSound();
                    },
                  ),
                ),
                //  ),
              ),
              SizedBox(
                height: 25.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                      kTextFieldInput.copyWith(hintText: 'Enter your email')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldInput.copyWith(
                      hintText: 'Enter your password')),
              SizedBox(
                height: 24.0,
              ),
              CustomButton(
                color: Colors.lightBlueAccent,
                title: 'Log In',
                onPressed: () async {
                  try {
                    setState(() {
                      showSpinner = true;
                    });
                    final user = (await _auth.signInWithEmailAndPassword(
                            email: email.trim(), password: password))
                        .user;
                    if (user != null) {
                      Navigator.pushNamed(context, '/c');
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  } catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('ERROR: Sign-in failed.'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              'OK',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
