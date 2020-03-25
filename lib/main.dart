import 'package:flutter/material.dart';
// import 'package:coursefidence/pages/auth.dart';
import 'package:coursefidence/pages/courses.dart';
import 'package:coursefidence/pages/overview.dart';
import 'package:provider/provider.dart';
import 'package:coursefidence/utils/course_model.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CourseModel>(
      builder: (context) => CourseModel(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          // '/': (BuildContext context) => Auth(),
          '/': (BuildContext context) => Overview(),
          '/courses': (BuildContext context) => Courses(),
        },
      ), // theme: Theme(data: ThemeData(accentColor: Color(Colors.orange)), child: null),
    );
  }
}
