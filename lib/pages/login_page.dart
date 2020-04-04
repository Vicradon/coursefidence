import 'package:coursefidence/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login here",
              style: Theme.of(context).textTheme.headline4,
            ),
            LoginForm()
          ],
        ),
      ),
    );
  }
}
