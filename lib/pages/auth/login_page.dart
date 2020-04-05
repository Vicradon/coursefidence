import 'package:coursefidence/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;
  LoginPage({this.toggleView});
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            LoginForm(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account yet?"),
                FlatButton(
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: Text("sign up"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
