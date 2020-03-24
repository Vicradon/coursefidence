import 'package:flutter/material.dart';
// import 'package:coursefidence/pages/auth.dart';
// import 'package:coursefidence/pages/overview.dart';
import 'package:coursefidence/pages/paschalChallenge.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // '/': (BuildContext context) => Auth(),
        '/': (BuildContext context) => GPUI(),
      },
      // theme: Theme(data: ThemeData(accentColor: Color(Colors.orange)), child: null),
    );
  }
}
