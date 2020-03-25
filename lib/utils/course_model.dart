import 'package:coursefidence/utils/courseDS.dart';
import 'package:flutter/foundation.dart';

// This model would contain a list of courseDS objects and info such as the number of courses
class CourseModel with ChangeNotifier {
  List<CourseDS> courseList = [];

  void add(data) {
    courseList.add(data);
    notifyListeners();
  }

  get getOverallConfidence {
    if (courseList.length > 0) {
      int total = courseList.map((e) => e.confidence).reduce((a, b) => a + b);
      int conf = (total / courseList.length).round();
      return conf;
    } else {
      return 0;
    }
  }

  get numOfCourses {
    return courseList.length;
  }

  get numOfUnits {
    if (courseList.length > 0) {
      return courseList.map((e) => int.parse(e.units)).reduce((a, b) => a + b);
    } else {
      return 0;
    }
  }
}
