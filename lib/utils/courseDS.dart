class CourseDS {
  String name;
  int confidence;
  int units;

  set nameChange(String newName){
    this.name = newName;
  }
  set confidenceChange(int newConfidence){
    this.confidence = newConfidence;
  }
  set unitsChange(int newUnits){
    this.units = newUnits;
  }
  CourseDS({this.name, this.confidence, this.units});
  
}