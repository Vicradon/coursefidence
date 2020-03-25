import 'package:coursefidence/utils/courseDS.dart';
import 'package:flutter/foundation.dart';

// This model would contain a list of courseDS objects and info such as the number of courses
class CourseModel with ChangeNotifier { 
  List<CourseDS> courseList = [];
}