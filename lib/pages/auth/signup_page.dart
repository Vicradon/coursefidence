import 'package:coursefidence/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final Function toggleView;
  SignupPage({this.toggleView});
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account?"),
                FlatButton(
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: Text("login"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
