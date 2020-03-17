import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Builder(
        builder: (context) => Center(
          child: RaisedButton(
            onPressed: () {
              print("Stuff");
              final snackBar = SnackBar(
                content: Text("Sign in not yet implemented", textAlign: TextAlign.center),
                // action: SnackBarAction(
                //   label: 'Undo',
                //   onPressed: () {
                //     // Some code to undo the change.
                //   },
                // ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Text("Sign In"),
          ),
        ),
      ),
    );
  }
}
