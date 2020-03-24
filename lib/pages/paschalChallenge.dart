import 'dart:ui';

import 'package:coursefidence/widgets/calculate-button.dart';
import 'package:coursefidence/widgets/gpa-unit.dart';
import 'package:coursefidence/widgets/add-new-course.dart';
import 'package:flutter/Material.dart';

class GPUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Oxygen CPGA",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Text(
              "HARMATTAN SEMESTER",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: <Widget>[
                GPAUnit(),
                GPAUnit(),
                GPAUnit(),
              ],
            ),
            AddNewCourse(),
            CalculateButton(),
            SizedBox(height: 10,),
            Divider(thickness: 1, color: Colors.black45,)
          ],
        ),
      ),
    );
  }
}
