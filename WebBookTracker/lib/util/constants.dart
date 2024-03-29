import 'package:flutter/material.dart';

const String kNetworkImageGeneric =
    "https://st4.depositphotos.com/1012074/26712/v/600/depositphotos_267121138-stock-illustration-young-avatar-face-with-sunglasses.jpg";

const Color kColorButton = Color(0xFF263238); // blueGrey.shade900
const Color kColorBackground = Color(0xFFCFD8DC); // blueGrey
const Color kColorAttention = Color(0xFFE53935); // red.shade100
const Color kColorFormOutline = Color(0xFFB0BEC5); // blueGrey.shade300
const kColorFormOutlineFocused = Color(0xFF455A64); // blueGrey.shade700

const TextStyle kTextStyleTesting =
    TextStyle(color: Colors.red, fontSize: 18.0);
const TextStyle kTextStyleButton = TextStyle(fontSize: 20.0);
const TextStyle kTextStyleAttention = TextStyle(
    fontSize: 18.0, fontStyle: FontStyle.italic, color: kColorAttention);
const TextStyle kTextStyleAttentionSmall = TextStyle(
    fontSize: 12.0, fontStyle: FontStyle.italic, color: kColorAttention);
const TextStyle kTextStyleGeneralInfo =
    TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic, color: Colors.black);
const TextStyle kTextStylePageInfo =
    TextStyle(fontSize: 20.0, color: Colors.black);
const TextStyle kTextStyleUserInfoItalics =
    TextStyle(fontSize: 20.0, color: Colors.black, fontStyle: FontStyle.italic);
const TextStyle kTextStyleUserInfoItalicsBold = TextStyle(
    fontSize: 20.0,
    color: Colors.black,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold);
const TextStyle kTextStyleUserInfoBold = TextStyle(
    fontSize: 20.0,
    color: Colors.black,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold);
const TextStyle kTextStyleUserInfoNormal =
    TextStyle(fontSize: 20.0, color: Colors.black);

InputDecoration kInputDecorationForm(
    {required String label, required String hint}) {
  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelText: label,
    labelStyle: TextStyle(fontSize: 14.0),
    floatingLabelStyle:
        TextStyle(color: kColorFormOutlineFocused, fontSize: 20.0),
    hintText: hint,
    hintStyle: TextStyle(fontSize: 16.0),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        borderSide: BorderSide(color: kColorFormOutline)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(color: kColorFormOutline),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(color: kColorFormOutlineFocused, width: 2.0),
    ),
  );
}
