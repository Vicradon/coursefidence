import 'package:flutter/material.dart';
// import 'package:coursefidence/pages/auth.dart';
import 'package:coursefidence/pages/overview.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // '/': (BuildContext context) => Auth(),
        '/': (BuildContext context) => Overview(),
      },
      // theme: Theme(data: ThemeData(accentColor: Color(Colors.orange)), child: null),
    );
  }
}
