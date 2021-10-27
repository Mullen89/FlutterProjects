import 'package:book_tracker_app/screens/user_home.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'custom_functions.dart';

class kFormSignIn extends StatelessWidget {
  const kFormSignIn(
      {Key? key,
      required GlobalKey<FormState> formKey,
      required TextEditingController emailTextController,
      required TextEditingController passwordTextController,
      required String errorCode})
      : _formKey = formKey,
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        error = errorCode,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              error,
              style: error == ''
                  ? kTextStyleGeneralInfo
                  : kTextStyleAttentionSmall,
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              // Having `onFieldSubmitted` as same as button allows the "ENTER" key press to submit.
              onFieldSubmitted: (value) {
                if (_formKey.currentState!.validate()) {
                  firebaseSignIn(
                      email: _emailTextController,
                      password: _passwordTextController,
                      context: context);
                }
              },
              validator: (value) {
                final bool _isValid = EmailValidator.validate(value.toString());
                return value!.isEmpty || !_isValid
                    ? "Please enter your email."
                    : null;
              },
              controller: _emailTextController,
              decoration: kInputDecorationForm(label: "Email", hint: "Email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              onFieldSubmitted: (value) {
                if (_formKey.currentState!.validate()) {
                  firebaseSignIn(
                      email: _emailTextController,
                      password: _passwordTextController,
                      context: context);
                }
              },
              validator: (value) {
                value!.isEmpty ? "Please enter your password." : null;
              },
              controller: _passwordTextController,
              obscureText: true,
              decoration:
                  kInputDecorationForm(label: "Password", hint: "Password"),
            ),
          )
        ],
      ),
    );
  }
}

class kFormCreateAccount extends StatelessWidget {
  const kFormCreateAccount(
      {Key? key,
      required GlobalKey<FormState> formKey,
      required TextEditingController emailTextController,
      required TextEditingController passwordTextController,
      required String errorCode})
      : _formKey = formKey,
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        error = errorCode,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              error == ''
                  ? "Enter a valid email address and password (must be 8 characters in length)."
                  : error,
              style: error == ''
                  ? kTextStyleGeneralInfo
                  : kTextStyleAttentionSmall,
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              onFieldSubmitted: (value) {
                if (_formKey.currentState!.validate()) {
                  firebaseCreateUserAndSignIn(
                      formKey: _formKey,
                      email: _emailTextController,
                      password: _passwordTextController,
                      context: context);
                }
              },
              validator: (value) {
                final bool _isValid = EmailValidator.validate(value.toString());
                return value!.isEmpty || !_isValid
                    ? "Please enter a valid email."
                    : null;
              },
              controller: _emailTextController,
              decoration: kInputDecorationForm(label: "Email", hint: "Email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              onFieldSubmitted: (value) {
                if (_formKey.currentState!.validate()) {
                  firebaseCreateUserAndSignIn(
                      formKey: _formKey,
                      email: _emailTextController,
                      password: _passwordTextController,
                      context: context);
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please create a password";
                } else if (value.length < 8) {
                  return "Password must be 8 characters in length";
                } else {
                  return null;
                }
              },
              controller: _passwordTextController,
              obscureText: true,
              decoration:
                  kInputDecorationForm(label: "Password", hint: "Password"),
            ),
          )
        ],
      ),
    );
  }
}
