import 'package:coursefidence/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:coursefidence/pages/home/courses.dart';
import 'package:provider/provider.dart';

class Overview extends StatelessWidget {
  final courseTextStyle = TextStyle(fontSize: 18, color: Colors.white);
  final confidenceTextStyle = TextStyle(fontSize: 50, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final courseModel = Provider.of<CourseModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Overview"),
      ),
      drawer: Drawer( 
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("User User"),
              accountEmail: Text("user@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("User"),
              ),
            ),
            ListTile(
              title: Text("Overview"),
              leading: Icon(Icons.remove_red_eye),
            ),
            ListTile(
              title: Text("Courses"),
              leading: Icon(Icons.book),
            ),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.info),
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
                    "${courseModel.getOverallConfidence}\%",
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
                  Text("${courseModel.numOfCourses} Courses", style: courseTextStyle),
                  SizedBox(height: 20),
                  Text("${courseModel.numOfUnits} Units", style: courseTextStyle)
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
