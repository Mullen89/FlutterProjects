import 'package:flutter/material.dart';
import 'constants.dart';

class kButtonBasicWithIcon extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final IconData buttonIcon;

  const kButtonBasicWithIcon(
      {required this.onPressed,
      required this.buttonText,
      required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Icon(buttonIcon),
      ),
      label: Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 20.0, bottom: 15.0),
        child: Text(buttonText),
      ),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: kColorButton,
        textStyle: kTextStyleButton,
        shadowColor: Colors.black,
        elevation: 3.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

class kButtonBasic extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;

  const kButtonBasic({required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: kColorButton,
        shadowColor: Colors.black,
        elevation: 3.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 8.0, left: 10.0, right: 10.0, bottom: 8.0),
        child: Text(
          buttonText,
          style: kTextStyleButton,
        ),
      ),
    );
  }
}

class kButtonAttention extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final IconData buttonIcon;

  const kButtonAttention(
      {required this.onPressed,
      required this.buttonText,
      required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(buttonIcon),
      label: Text(buttonText),
      style: TextButton.styleFrom(
        primary: kColorAttention,
        textStyle: kTextStyleAttention,
      ),
    );
  }
}
