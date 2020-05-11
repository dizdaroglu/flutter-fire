import 'package:flutter/material.dart';
import 'package:flutter_fire/core/services/firebase_service.dart';
import 'package:flutter_fire/model/user/user_request.dart';
import 'package:flutter_fire/ui/shared/styles/register_view_styles.dart';
import 'package:flutter_fire/ui/shared/widgets/rounded_button.dart';
import 'package:flutter_fire/ui/views/home/home_view.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String username;
  String password;
  String confirmPassword;
  FirebaseService service = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Register",
                    style: registerTextStyle,
                  ),
                  SizedBox(
                    height: 52,
                  ),
                  TextField(
                    decoration: inputDecorationStyle,
                    onChanged: (val) {
                      setState(() {
                        username = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    decoration:
                        inputDecorationStyle.copyWith(labelText: "Password"),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    decoration: inputDecorationStyle.copyWith(
                        labelText: "Confirm password"),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        confirmPassword = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  RoundedButton(
                    onPressed: () {
                      passControl();
                    },
                    colour: Color(0xffe74c3c),
                    title: "Login",
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  void passControl() async {
    if (password == confirmPassword) {
      await service.postRegister(UserRequest(
          email: username, password: password, returnSecureToken: true));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeView()));
    } else {
      print("hata!!!");
    }
  }
}
