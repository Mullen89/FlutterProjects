import 'package:book_tracker_app/models/book.dart';
import 'package:book_tracker_app/models/user.dart';
import 'package:book_tracker_app/screens/sign_in_screen.dart';
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
                  InkWell(
                    child: CircleAvatar(
                      radius: 25.0,
                      // run: ""flutter run -d chrome --web-renderer html"" or image may not show up.
                      backgroundImage: NetworkImage(currentUser.avatar == ""
                          ? kNetworkImageGeneric
                          : currentUser.avatar),
                      backgroundColor: Colors.black,
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                content: Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton.icon(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.mode_edit,
                                            color: kColorButton,
                                          ),
                                          label: Text(""))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 50.0,
                                        backgroundImage: NetworkImage(
                                            currentUser.avatar == ""
                                                ? kNetworkImageGeneric
                                                : currentUser.avatar),
                                        backgroundColor: Colors.black,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0, bottom: 4.0),
                                        child: Text(
                                          currentUser.displayName.toUpperCase(),
                                          style: kTextStyleUserInfoItalicsBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          currentUser.profession,
                                          style: kTextStyleUserInfoNormal,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          currentUser.quote,
                                          style: kTextStyleUserInfoItalics,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ));
                          });
                    },
                  )
                ],
              );
            },
          ),
          TextButton.icon(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                return Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              });
            },
            icon: Icon(
              Icons.logout,
              color: kColorButton,
            ),
            label: Text(''),
          )
        ],
      ),
    );
  }
}
