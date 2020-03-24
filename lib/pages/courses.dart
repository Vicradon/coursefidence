import 'package:flutter/material.dart';
import 'package:coursefidence/utils/courseDS.dart';

class Courses extends StatelessWidget {
  // _openCourseMenu(context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Container(
  //         child: ListView(children: <Widget>[
  //           ListTile(
  //             title: Row(
  //               children: <Widget>[Icon(Icons.edit), Text("Edit")],
  //             ),
  //           ),
  //           ListTile(
  //             title: Row(
  //               children: <Widget>[Icon(Icons.delete), Text("Delete")],
  //             ),
  //           ),
  //         ]),
  //       );
  //     },
  //   );
  // }

  final List<Widget> courses = [
    ListTile(title: Text("CSC 201"), trailing: Text("89%")),
  ];

  List<Widget> generatedCourses() {
    List<Widget> gen = [];

    for (int i = 0; i < courses.length; i++) {
      gen.add(courses[i]);
      gen.add(Divider());
    }
    return gen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: generatedCourses(),
        ),
      ),
      floatingActionButton: Fab(courses: courses),
    );
  }
}

class Fab extends StatelessWidget {
  final List<Widget> courses;
  Fab({this.courses});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(child: CourseForm(courses: courses));
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}

class CourseForm extends StatefulWidget {
  final List<Widget> courses;
  CourseForm({this.courses});
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
    return Form(
      key: _formKey,
      child: Container(
        height: 400,
        // clipBehavior: Clip.round,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: <Widget>[
            Text(
              "Add course",
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
                      setState(() {
                        widget.courses.add(
                          ListTile(
                            title: Text("${courseData.name}"),
                            trailing: Text("${courseData.confidence}%"),
                          ),
                        );
                      });
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

class ConfidenceSlide extends StatefulWidget {
  final CourseDS course;

  ConfidenceSlide({this.course});
  @override
  SlideState createState() => SlideState();
}

class SlideState extends State<ConfidenceSlide> {
  var _duelCommandment = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          "Confidence level",
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
        Slider.adaptive(
          value: _duelCommandment.toDouble(),
          min: 0,
          max: 100.0,
          divisions: 99,
          label: '$_duelCommandment%',
          // onChanged: widget.onChangedSlide,
          onChanged: (double newValue) {
            // widget.onChangedSlide();
            setState(() {
              widget.course.confidence = newValue.round();
              _duelCommandment = newValue.round();
            });
          },
        ),
      ],
    );
  }
}
