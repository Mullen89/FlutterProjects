import 'package:cloud_firestore/cloud_firestore.dart';

class WebsiteUser {
  final String id;
  final String uid;
  final String displayName;
  final String profession;
  final String quote;
  final String avatar;

  WebsiteUser(
      {this.id = '',
      this.uid = '',
      this.displayName = '',
      this.profession = '',
      this.quote = '',
      this.avatar = ''});

  // This method gets the snapshot data from the StreamBuilder
  // used in the home page.
  factory WebsiteUser.fromDocument(QueryDocumentSnapshot data) {
    return WebsiteUser(
        id: data.id,
        uid: data.get('UID'),
        displayName: data.get('DisplayName'),
        profession: data.get('Profession'),
        quote: data.get('Quote'),
        avatar: data.get('AvatarUrl'));
  }

  String getID() {
    return this.id;
  }

  String getUID() {
    return this.uid;
  }

  String getDisplayName() {
    return displayName;
  }

  String getProfession() {
    return profession;
  }

  String getQuote() {
    return quote;
  }

  String getAvatar() {
    // Profile pic.
    return avatar;
  }
}
