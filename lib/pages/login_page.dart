import 'package:coursefidence/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Builder(
        builder: (context) => Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}
