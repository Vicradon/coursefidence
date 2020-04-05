class CourseDS {
  String name;
  int confidence;
  String units;

  set courseName(String newName){
    this.name = newName;
  }
  set confidenceChange(int newConfidence){
    this.confidence = newConfidence;
  }
  set courseUnits(String newUnits){
    this.units = newUnits;
  }
  CourseDS({this.name, this.confidence = 0, this.units});
  
}