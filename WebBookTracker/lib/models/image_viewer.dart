import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  final String imageURL;
  final String imageTitle;

  const ImageViewPage({required this.imageURL, this.imageTitle = ""});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(imageTitle, style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            child: Image.network(imageURL),
          ),
        ),
      ),
    );
  }
}
