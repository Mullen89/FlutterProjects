import 'package:book_tracker_app/models/book.dart';
import 'package:book_tracker_app/models/user.dart';
import 'package:book_tracker_app/util/constants.dart';
import 'package:book_tracker_app/util/custom_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference booksCollection =
        FirebaseFirestore.instance.collection('books');
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: false,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Row(
          children: [
            Text(
              "A. Reader",
              style: Theme.of(context).textTheme.headline6,
            ),

            // This StreamBuilder gets the data from the firebase cloudstore database.
            kStreamBuilderUserDataSnapshot(
              usersCollection: usersCollection,
              userDataTrait: "displayName",
              textStyle: kTextStyleTesting,
            ),
          ],
        ),
      ),
    );
  }
}
