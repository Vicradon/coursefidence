import 'package:coursefidence/utils/course_model.dart';
import 'package:coursefidence/utils/courseDS.dart';
import 'package:coursefidence/widgets/confidence_slide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseForm extends StatefulWidget {

  @override
  CourseFormState createState() {
    return CourseFormState();
  }
}


class CourseFormState extends State<CourseForm> {
  final _formKey = GlobalKey<FormState>();
  // final Map<String, dynamic> courseData = {
  //   "courseName": null,
  //   "courseUnits": null,
  //   "confidenceLevel": null
  // };

  final courseData = new CourseDS();

  get theCourseData {
    return courseData;
  }

  final focusCourseUnits = FocusNode();

  @override
  Widget build(BuildContext context) {
    final courseModel = Provider.of<CourseModel>(context, listen: false);

    return Form(
      key: _formKey,
      child: Container(
        // height: 400,
        // clipBehavior: Clip.round,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: ListView(
          children: <Widget>[
            Text(
              "Add courses",
              style: TextStyle(fontSize: 25),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.book),
                hintText: 'Course Name',
                labelText: 'Name *',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter the course name';
                }
                return null;
              },
              onSaved: (String value) {
                courseData.courseName = value;
              },
              onFieldSubmitted: (v) {
                FocusScope.of(context).requestFocus(focusCourseUnits);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.confirmation_number),
                hintText: 'Course Units',
                labelText: 'Units *',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter the course unit';
                }
                return null;
              },
              onSaved: (String value) {
                courseData.courseUnits = value;
              },
              focusNode: focusCourseUnits,
            ),
            ConfidenceSlide(course: courseData),
            SizedBox(height: 30),
            Builder(
              builder: (BuildContext context) {
                return RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                        courseModel.courseList.add(courseData);
                    }
                  },
                  child: Text('Submit'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}