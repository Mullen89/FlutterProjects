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
          ],
        ),
        actions: [
          StreamBuilder<QuerySnapshot>(
            stream: usersCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final userListStream = snapshot.data!.docs.map((userData) {
                return WebsiteUser.fromDocument(userData);
              }).where((element) {
                return (element.uid == FirebaseAuth.instance.currentUser!.uid);
              }).toList();

              WebsiteUser currentUser = userListStream.first;
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      currentUser.displayName,
                      style: kTextStylePageInfo,
                    ),
                  ),
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(currentUser.avatar),
                    backgroundColor: Colors.black,
                  )
                ],
              );
            },
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.logout),
            label: Text(''),
          )
        ],
      ),
    );
  }
}
