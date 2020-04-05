import 'package:coursefidence/pages/auth/login_page.dart';
import 'package:coursefidence/pages/auth/signup_page.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLogin = true;
  void toggleView(){
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginPage(toggleView:  toggleView);
    } else {
      return SignupPage(toggleView:  toggleView);
    }
  }
}