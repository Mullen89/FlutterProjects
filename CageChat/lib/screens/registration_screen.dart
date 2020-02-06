import 'package:flutter/material.dart';
import 'package:flash_chat/components/custom_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:audioplayers/audio_cache.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

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
                //     child: Hero(
                //    tag: 'logo',
                child: Container(
                  height: 150.0,
                  child: Image.asset('images/cage.png'),
                ),
                //     ),
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
                color: Colors.blueAccent,
                title: 'Register',
                onPressed: () async {
                  if (password.length < 6) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(
                            'Password must be at least 6 characters long.'),
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
                  } else {
                    try {
                      setState(() {
                        showSpinner = true;
                      });
                      final newUser =
                          (await _auth.createUserWithEmailAndPassword(
                                  email: email.trim(), password: password))
                              .user;
                      if (newUser != null) {
                        Navigator.pushNamed(context, '/c');
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      setState(() {
                        showSpinner = false;
                      });
                      print(e);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
