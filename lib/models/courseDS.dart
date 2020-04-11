import 'package:uuid/uuid.dart';

class CourseDS {
  String name;
  int confidence;
  String units;
  var _uuid = Uuid().v1();

  set courseName(String newName) {
    this.name = newName;
  }

  set confidenceChange(int newConfidence) {
    this.confidence = newConfidence;
  }

  set courseUnits(String newUnits) {
    this.units = newUnits;
  }

  get id => _uuid;
  set id(id) => _uuid = id;

  CourseDS({this.name, this.confidence = 0, this.units});
}
