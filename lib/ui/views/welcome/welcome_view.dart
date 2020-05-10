import 'package:flutter/material.dart';
import 'package:flutter_fire/ui/shared/styles/welcome_view_styles.dart';
import 'package:flutter_fire/ui/shared/widgets/rounded_button.dart';
import 'package:flutter_fire/ui/views/authentication/login_view.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Welcome",
                  style: logoTextStyle,
                ),
                SizedBox(
                  height: 52,
                ),
                RoundedButton(
                  colour: Color(0xffe74c3c),
                  title: "Login",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },
                ),
                RoundedButton(
                  colour: Color(0xffe74c3c),
                  title: "Register",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
