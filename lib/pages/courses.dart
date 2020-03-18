import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[],
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
            return Container(child: CourseForm()
                // Wrap(
                //   children: <Widget>[
                //     ListTile(
                //         leading: Icon(Icons.music_note),
                //         title: Text('Music'),
                //         onTap: () => {}),
                //     ListTile(
                //       leading: Icon(Icons.videocam),
                //       title: Text('Video'),
                //       onTap: () => {},
                //     ),
                //   ],
                // ),
                );
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
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
        child: Column(
          children: <Widget>[
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