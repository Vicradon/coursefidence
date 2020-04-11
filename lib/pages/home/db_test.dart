// import 'package:coursefidence/services/database_helper.dart';
import 'package:flutter/material.dart';

class DBTest extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(primary: true, title: Text("DB Test"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                // final dbInstance = DatabaseHelper();
              },
              child: Text("Add to DB"),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("Remove from DB"),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("Query  DB"),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("Delete last inputed data"),
            ),
          ],
        ),
      ),
    );
  }
}
