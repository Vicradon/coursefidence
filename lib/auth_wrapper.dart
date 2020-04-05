import 'package:coursefidence/models/user.dart';
import 'package:coursefidence/pages/auth/auth.dart';
import 'package:coursefidence/pages/home/overview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Overview();
    }
  }
}
