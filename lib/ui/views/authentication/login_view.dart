import 'package:flutter/material.dart';
import 'package:flutter_fire/ui/shared/styles/login_view_styles.dart';
import 'package:flutter_fire/ui/shared/widgets/rounded_button.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: loginTextStyle,
                    ),
                    SizedBox(
                      height: 52,
                    ),
                    TextField(
                      decoration: inputDecorationStyle,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextField(
                      decoration:
                          inputDecorationStyle.copyWith(labelText: "Password"),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    RoundedButton(
                      onPressed: () {},
                      colour: Color(0xffe74c3c),
                      title: "Login",
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
