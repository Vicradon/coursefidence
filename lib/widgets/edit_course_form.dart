import 'package:coursefidence/models/course_model.dart';
import 'package:coursefidence/widgets/confidence_slide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class EditCourseForm extends StatefulWidget {
  EditCourseForm({this.course});
  final course;
  @override
  EditCourseFormState createState() {
    return EditCourseFormState();
  }
}

class EditCourseFormState extends State<EditCourseForm> {
  final _formKey = GlobalKey<FormState>();

  final focusCourseUnits = FocusNode();
  TextEditingController _nameController;
  TextEditingController _unitsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.course.name);
    _unitsController = TextEditingController(text: (widget.course.units));
  }

  @override
  Widget build(BuildContext context) {
    final courseModel = Provider.of<CourseModel>(context);

    return Form(
      key: _formKey,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
        child: ListView(
          children: <Widget>[
            Text(
              "Edit course",
              style: TextStyle(fontSize: 25),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
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
              // onSaved: (String value) {
              //   courseData.courseName = value;
              // },
              onFieldSubmitted: (v) {
                FocusScope.of(context).requestFocus(focusCourseUnits);
              },
            ),
            TextFormField(
              controller: _unitsController,
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
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
              // onSaved: (String value) {
              //   courseData.courseUnits = value;
              // },
              focusNode: focusCourseUnits,
            ),
            SizedBox(height: 30),
            ConfidenceSlide(course: widget.course),
            SizedBox(height: 30),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  courseModel.update(widget.course.id, _nameController.text,
                      widget.course.confidence, _unitsController.text);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
