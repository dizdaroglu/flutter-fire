import 'package:flutter/material.dart';
import 'package:flutter_fire/core/services/firebase_service.dart';
import 'package:flutter_fire/model/user/user_auth_error.dart';
import 'package:flutter_fire/model/user/user_request.dart';
import 'package:flutter_fire/ui/shared/styles/login_view_styles.dart';
import 'package:flutter_fire/ui/shared/widgets/rounded_button.dart';
import 'package:flutter_fire/ui/views/home/home_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String username;
  String password;
  FirebaseService service = FirebaseService();
  GlobalKey<ScaffoldState> scaffold = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
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
                      height: 24,
                    ),
                    RoundedButton(
                      onPressed: () async {
                        var result = await service.postUser(UserRequest(
                            email: username,
                            password: password,
                            returnSecureToken: true));
                        if (result is FirebaseAuthError) {
                          scaffold.currentState.showSnackBar(
                              SnackBar(content: Text(result.error.message)));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeView()));
                        }
                      },
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
