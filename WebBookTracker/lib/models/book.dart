import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String id;
  final String author;
  final String title;
  final String genre;
  final String description;
  final String notes;

  Book(
      {this.id = '',
      this.author = '',
      this.title = '',
      this.genre = '',
      this.description = '',
      this.notes = ''});

  // This method gets the snapshot data from the StreamBuilder
  // used in the home page.
  factory Book.fromDocument(QueryDocumentSnapshot data) {
    return Book(
        id: data.id,
        title: data.get('Title'),
        author: data.get('Author'),
        genre: data.get('Genre'),
        description: data.get('Description'),
        notes: data.get('Notes'));
  }
}
