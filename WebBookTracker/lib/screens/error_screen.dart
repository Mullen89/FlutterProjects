import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("ERROR", style: TextStyle(color: Colors.red)),
          Text("Something went wrong.", style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
