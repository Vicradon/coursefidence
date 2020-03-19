import 'package:flutter/material.dart';
// import 'package:coursefindence/pages/auth.dart';
import 'package:coursefindence/pages/overview.dart';

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
      }
    );
  }
}