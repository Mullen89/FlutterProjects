import 'package:book_tracker_app/util/constants.dart';
import 'package:book_tracker_app/util/custom_forms.dart';
import 'package:book_tracker_app/util/custom_functions.dart';
import 'package:book_tracker_app/util/custom_widgets.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool createAccountClicked = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(color: kColorBackground),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: createAccountClicked
                ? Text(
                    "Create an Account",
                    style: Theme.of(context).textTheme.headline5,
                  )
                : Text(
                    "Sign In",
                    style: Theme.of(context).textTheme.headline5,
                  ),
          ),
          Column(
            children: [
              SizedBox(
                height: 300.0,
                width: 300.0,
                child: createAccountClicked
                    ? kFormCreateAccount(
                        formKey: _formKey,
                        emailTextController: _emailTextController,
                        passwordTextController: _passwordTextController,
                        errorCode: '',
                      )
                    : kFormSignIn(
                        formKey: _formKey,
                        emailTextController: _emailTextController,
                        passwordTextController: _passwordTextController,
                        errorCode: '',
                      ),
              ),
              SizedBox(height: 30.0),
              createAccountClicked
                  ? kButtonBasic(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          firebaseCreateUserAndSignIn(
                              formKey: _formKey,
                              email: _emailTextController,
                              password: _passwordTextController,
                              context: context);
                        }
                      },
                      buttonText: "Create Account")
                  : kButtonBasic(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          firebaseSignIn(
                              email: _emailTextController,
                              password: _passwordTextController,
                              context: context);
                        }
                      },
                      buttonText: "Sign In"),
              SizedBox(
                height: 30.0,
              ),
              kButtonAttention(
                  onPressed: () {
                    setState(() {
                      createAccountClicked
                          ? createAccountClicked = false
                          : createAccountClicked = true;
                    });
                  },
                  buttonText: createAccountClicked
                      ? "Already have an account?"
                      : "Create Account",
                  buttonIcon: Icons.portrait_rounded)
            ],
          ),
          Expanded(
            flex: 2,
            child: Container(color: kColorBackground),
          ),
        ],
      )),
    );
  }
}
