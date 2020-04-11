import 'package:coursefidence/models/course_model.dart';
import 'package:coursefidence/widgets/crud_actions_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:coursefidence/widgets/add_new_course_form.dart';
import 'package:provider/provider.dart';

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final courseModel = Provider.of<CourseModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: courseModel.courseList.length,
          itemBuilder: (context, index) {
            final name = courseModel.courseList[index].name;
            final confidence = courseModel.courseList[index].confidence;
            final id = courseModel.courseList[index].id;
            return ListTile(
              title: Text(name),
              trailing: Text("$confidence%"),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                  ),
                  builder: (context) {
                    return CRUDActionsBottomSheet(id: id);
                  },
                );
              },
            );
          },
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
          isScrollControlled: true,
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
