import 'package:coursefidence/utils/course_model.dart';
import 'package:flutter/material.dart';
import 'package:coursefidence/widgets/add_new_course_form.dart';
import 'package:provider/provider.dart';

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

  List<Widget> generatedCourses(modelList) {
    // List<Widget> gen = [];
    // final List<dynamic> courses = model.forEach(
    //   (i) => ListTile(title: Text(i.name), trailing: Text("${i.confidence}%")),
    // ).toList();

    // for (int i = 0; i < courses.length; i++) {
    //   gen.add(courses[i]);
    //   gen.add(Divider());
    // }
    // List<dynamic> dude = modelList.map(
    //   (i) => ListTile(title: Text(i.name), trailing: Text("${i.confidence}%")),
    // ).toList();
    // return dude;
  }

  @override
  Widget build(BuildContext context) {
    final courseModel = Provider.of<CourseModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Courses"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Consumer<CourseModel>(
          builder: (context, model, child) {
            return ListView.builder(
                itemCount: model.courseList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(model.courseList[index].name),
                    trailing: Text("${model.courseList[index].confidence}"),
                  );
                }
                );
            // ListView.builder(
            //   itemCount: courseModel.courseList.length,
            //   itemBuilder: (context, index) {
            //     final name = courseModel.courseList[index].name;
            //     final confidence = courseModel.courseList[index].confidence;
            //     return ListTile(
            //         title: Text(name), trailing: Text("$confidence%"));
            //   },
            // );
          },
        ),
      ),
      floatingActionButton: Fab(),
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
            return Container(child: CourseForm());
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
