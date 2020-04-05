import 'package:coursefidence/models/course_model.dart';
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
            return ListTile(title: Text(name), trailing: Text("$confidence%"));
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
