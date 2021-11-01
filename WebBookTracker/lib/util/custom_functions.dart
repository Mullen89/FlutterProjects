import 'dart:html';

import 'package:book_tracker_app/models/user.dart';
import 'package:book_tracker_app/screens/sign_in_screen.dart';
import 'package:book_tracker_app/screens/user_home.dart';
import 'package:book_tracker_app/util/custom_forms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

void firebaseSignIn(
    {required TextEditingController email,
    required TextEditingController password,
    required BuildContext context}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.toString().toLowerCase(),
        password: password.text.toString().toLowerCase());
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserHomePage(),
        ));
  } on FirebaseAuthException catch (e) {
    throw e;
  }
}

void firebaseCreateUserAndSignIn(
    {required GlobalKey<FormState> formKey,
    required TextEditingController email,
    required TextEditingController password,
    required BuildContext context}) async {
  String displayName = email.text.toString().split('@')[0].toLowerCase();
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text.toString().toLowerCase(),
      password: password.text.toString().toLowerCase());
  await createUser(displayName: displayName);
  firebaseSignIn(email: email, password: password, context: context);
}

Future<void> createUser({required String displayName}) async {
  final CollectionReference userCollectionReference =
      FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String userUID = auth.currentUser!.uid;
  String profession = "Your profession...";
  String quote = "A quote you like...";

  Map<String, dynamic> user = {
    'AvatarUrl': '',
    'DisplayName': displayName,
    'Profession': profession,
    'Quote': quote,
    'UID': userUID,
  };

  await userCollectionReference.add(user);
}

void firebaseUpdateProfile(
    {required WebsiteUser mUser,
    required String newName,
    required String newProfession,
    required String newQuote,
    required String newAvatar,
    required BuildContext context}) async {
  final CollectionReference userCollectionReference =
      FirebaseFirestore.instance.collection('users');

  Map<String, dynamic> user = {
    'AvatarUrl': newAvatar,
    'DisplayName': newName,
    'Profession': newProfession,
    'Quote': newQuote,
    'UID': mUser.uid,
  };

  await userCollectionReference.doc(mUser.id).update(user);

  Navigator.pop(context);
}
