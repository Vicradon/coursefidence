import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  _openCourseMenu(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView(children: <Widget>[
            ListTile(
              title: Row(
                children: <Widget>[Icon(Icons.edit), Text("Edit")],
              ),
            ),
            ListTile(
              title: Row(
                children: <Widget>[Icon(Icons.delete), Text("Delete")],
              ),
            ),
          ]),
        );
      },
    );
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
          children: <Widget>[
            ListTile(
              title: Text("CSC 201"),
              trailing: Text("89%"),
            ),
            Divider(),
            ListTile(
              title: Text("CSC 203"),
              trailing: Text("59%"),
              onTap: _openCourseMenu(context),
            ),
            Divider(),
            ListTile(
              title: Text("CSC 205"),
              trailing: Text("63%"),
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButton: Fab(),
    );
  }
}

class Fab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(child: CourseForm());
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}

class CourseForm extends StatefulWidget {
  @override
  CourseFormState createState() {
    return CourseFormState();
  }
}

class CourseFormState extends State<CourseForm> {
  final _formKey = GlobalKey<FormState>();

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
            ),
            // ConfidenceRangeSlide(),
            SizedBox(height: 30),

            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
/*
class ConfidenceRangeSlide extends StatefulWidget {
  @override
  RangeSlideState createState() => RangeSlideState();
}
*/
/*
class RangeSlideState extends State<ConfidenceRangeSlide> {
  RangeValues _values = RangeValues(0.3, 0.7);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _values,
      min: 0,
      max: 100,
      onChanged: null,
      divisions: 100,
      onChangeStart: (RangeValues values) {
        setState(() {
          _values = values;
        });
      },
      // onChanged: (RangeValues values) {
      //   setState(() {
      //     _values = values;
      //   });
      // },
    );
  }
}

*/
