import 'package:coursefidence/widgets/edit_course_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coursefidence/models/course_model.dart';

class CRUDActionsBottomSheet extends StatelessWidget {
  CRUDActionsBottomSheet({this.id});
  final id;
  Widget build(BuildContext context) {
    final courseModel = Provider.of<CourseModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Edit course'),
          onTap: () {
            final course = courseModel.edit(id);
            Navigator.of(context).pop();
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
              ),
              builder: (context) {
                return EditCourseForm(course: course);
              },
            );
            print(course.units);
          },
        ),
        ListTile(
          leading: Icon(Icons.delete),
          title: Text('Delete course'),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Delete course"),
                  content: Text("Do you really want to delete this course?"),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("cancel")),
                    RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          courseModel.delete(id);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: Text("of course")),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
