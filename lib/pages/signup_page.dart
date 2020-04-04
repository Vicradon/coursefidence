import 'package:coursefidence/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign up here",
              style: Theme.of(context).textTheme.headline4,
            ),
            SignupForm(),
          ],
        ),
      ),
    );
  }
}
