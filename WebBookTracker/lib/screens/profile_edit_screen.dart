import 'package:book_tracker_app/models/user.dart';
import 'package:book_tracker_app/util/constants.dart';
import 'package:book_tracker_app/util/custom_functions.dart';
import 'package:book_tracker_app/util/custom_widgets.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  final WebsiteUser mUser;

  const ProfileEditPage({required this.mUser});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _nameTextController =
        TextEditingController(text: mUser.displayName);
    final TextEditingController _professionTextController =
        TextEditingController(text: mUser.profession);
    final TextEditingController _quoteTextController =
        TextEditingController(text: mUser.quote);
    final TextEditingController _avatarTextController =
        TextEditingController(text: mUser.avatar);

    return AlertDialog(
      content: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Edit ${mUser.displayName}',
                    style: kTextStyleUserInfoBold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 20.0),
                child: CircleAvatar(
                  radius: 75.0,
                  backgroundImage: NetworkImage(
                      mUser.avatar == "" ? kNetworkImageGeneric : mUser.avatar),
                  backgroundColor: Colors.black,
                ),
              ),
              // Display name field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Your name cannot be empty.";
                    } else if (value.length > 40) {
                      return "Your display name is too long.";
                    } else {
                      return null;
                    }
                  },
                  controller: _nameTextController,
                  decoration: kInputDecorationForm(
                      label: "Name", hint: mUser.displayName),
                ),
              ),
              // Profession field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _professionTextController,
                  decoration: kInputDecorationForm(
                      label: "Profession",
                      hint: mUser.profession == ""
                          ? "Profession"
                          : mUser.profession),
                ),
              ),
              // Quote field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _quoteTextController,
                  decoration: kInputDecorationForm(
                      label: "Quote",
                      hint: mUser.quote == ""
                          ? "Favorite quote..."
                          : mUser.quote),
                ),
              ),
              // Avatar field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _avatarTextController,
                  decoration: kInputDecorationForm(
                      label: "Profile Photo URL",
                      hint: mUser.avatar == "" ? "Image URL" : mUser.avatar),
                ),
              ),
              // Buttons
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12.0),
                    child: kButtonBasic(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        buttonText: "Cancel"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12.0),
                    child: kButtonBasic(
                        onPressed: () {
                          firebaseUpdateProfile(
                              mUser: mUser,
                              newName: _nameTextController.text.toString(),
                              newProfession:
                                  _professionTextController.text.toString(),
                              newQuote: _quoteTextController.text.toString(),
                              newAvatar: _avatarTextController.text.toString(),
                              context: context);
                        },
                        buttonText: "Submit"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
