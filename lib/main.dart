import 'package:coursefidence/auth_wrapper.dart';
import 'package:coursefidence/models/user.dart';
import 'package:coursefidence/services/auth.dart';
import 'package:flutter/material.dart';
// import 'package:coursefidence/pages/auth/login_page.dart';
// import 'package:coursefidence/pages/auth/signup_page.dart';
import 'package:coursefidence/pages/home/courses.dart';
// import 'package:coursefidence/pages/home/overview.dart';
import 'package:provider/provider.dart';
import 'package:coursefidence/models/course_model.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      stream: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        routes: {
          '/': (BuildContext context) => AuthWrapper(),
          '/courses': (BuildContext context) => Courses(),
        },
      ),
    );
  }
}
