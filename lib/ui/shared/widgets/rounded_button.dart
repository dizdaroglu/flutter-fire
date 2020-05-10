import 'package:flutter/material.dart';
import 'package:flutter_fire/ui/shared/styles/welcome_view_styles.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, this.colour, @required this.onPressed});

  final String title;
  final Color colour;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Material(
        color: colour,
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          height: 42,
          minWidth: MediaQuery.of(context).size.width,
          onPressed: onPressed,
          child: Text(
            title.toUpperCase(),
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
