import 'package:flutter/material.dart';
import 'package:coursefindence/pages/courses.dart';

class Overview extends StatelessWidget {
  final courseTextStyle = TextStyle(fontSize: 18, color: Colors.white);
  final confidenceTextStyle = TextStyle(fontSize: 50, color: Colors.white);

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/logo.png'),
          ),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Flutter Step-by-Step",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Overview"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            Divider(),
            Divider(),
            _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
            ListTile(
              title: Text('0.0.1'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0),
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 35.0),
              color: Colors.lightBlue,
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
              color: Colors.lightBlue,
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
              color: Colors.lightBlue,
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
