import 'package:coursefidence/auth_wrapper.dart';
import 'package:coursefidence/models/course_model.dart';
import 'package:coursefidence/models/user.dart';
import 'package:coursefidence/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      stream: AuthService().user,
      child: ChangeNotifierProvider<CourseModel>(
        builder: (context) => CourseModel(),
        child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          routes: {
            '/': (BuildContext context) => AuthWrapper(),
          },
        ),
      ),
    );
  }
}
