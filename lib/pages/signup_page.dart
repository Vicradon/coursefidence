import 'package:coursefidence/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: Builder(
        builder: (context) => Center(
          child: SignupForm(),
        ),
      ),
    );
  }
}
