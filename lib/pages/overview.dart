import 'package:flutter/material.dart';
import 'package:coursefindence/pages/courses.dart';

class Overview extends StatelessWidget {
  final courseTextStyle = TextStyle(fontSize: 18, color: Colors.white);
  final confidenceTextStyle = TextStyle(fontSize: 50, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overview"),
      ),
      drawer: Drawer(
        
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0),
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 35.0),
              color: Colors.green,
              child: Column(
                children: <Widget>[
                  Text("Overrall Confidence", style: courseTextStyle),
                  SizedBox(height: 20),
                  Text(
                    "43\%",
                    style: confidenceTextStyle,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 135.0, vertical: 50.0),
              margin: EdgeInsets.only(bottom: 30),
              color: Colors.green,
              child: Column(
                children: <Widget>[
                  Text("9 Courses", style: courseTextStyle),
                  SizedBox(height: 20),
                  Text("23 Units", style: courseTextStyle)
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => Courses());
                Navigator.push(context, route);
                // Navigator.pushNamed(context, '/courses');
              },
              padding: EdgeInsets.symmetric(horizontal: 135),
              color: Colors.green,
              child: Text(
                "Go to courses",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
