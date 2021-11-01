import 'package:book_tracker_app/models/book.dart';
import 'package:book_tracker_app/models/image_viewer.dart';
import 'package:book_tracker_app/models/user.dart';
import 'package:book_tracker_app/screens/profile_edit_screen.dart';
import 'package:book_tracker_app/screens/sign_in_screen.dart';
import 'package:book_tracker_app/util/constants.dart';
import 'package:book_tracker_app/util/custom_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

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
                      child: OctoImage(
                        image: NetworkImage(currentUser.avatar == ""
                            ? kNetworkImageGeneric
                            : currentUser.avatar),
                        imageBuilder: OctoImageTransformer.circleAvatar(),
                        errorBuilder: (context, error, stacktrace) =>
                            Icon(Icons.error),
                        progressIndicatorBuilder:
                            OctoProgressIndicator.circularProgressIndicator(),
                      ),
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
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return ProfileEditPage(
                                                  mUser: currentUser,
                                                );
                                              },
                                            ).then((value) =>
                                                Navigator.pop(context));
                                          },
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
                                      InkWell(
                                        child: CircleAvatar(
                                          radius: 75.0,
                                          backgroundImage: NetworkImage(
                                              currentUser.avatar == ""
                                                  ? kNetworkImageGeneric
                                                  : currentUser.avatar),
                                          backgroundColor: Colors.black,
                                        ),
                                        onTap: () {
                                          currentUser.avatar == ""
                                              ? null
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ImageViewPage(
                                                      imageURL:
                                                          currentUser.avatar,
                                                      imageTitle:
                                                          "Profile Photo",
                                                    ),
                                                  ));
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
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
                                      Text(
                                        '${currentUser.profession}',
                                        style: kTextStyleUserInfoNormal,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          currentUser.quote,
                                          style: kTextStyleUserInfoItalics,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                    width: 250.0,
                                    child: Divider(
                                        thickness: 2.0, color: kColorButton),
                                  )
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
