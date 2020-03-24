import 'package:flutter/Material.dart';
import 'package:dotted_border/dotted_border.dart';

class AddNewCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DottedBorder(
        color: Colors.black87,
        strokeWidth: 1,
        // strokeCap: StrokeCap.butt,
        child: Center(child:Text("Add New Course")),
        // radius: Radius.circular(40),
        radius: Radius.circular(40),
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        // padding: EdgeInsets.symmetric(vertical:20),
      ),
    );
  }
}
