import 'package:coursefidence/utils/courseDS.dart';
import 'package:flutter/material.dart';

class ConfidenceSlide extends StatefulWidget {
  final CourseDS course;

  ConfidenceSlide({this.course});
  @override
  SlideState createState() => SlideState();
}

class SlideState extends State<ConfidenceSlide> {
  var _duelCommandment = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          "Confidence level",
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
        Slider.adaptive(
          value: _duelCommandment.toDouble(),
          min: 0,
          max: 100.0,
          divisions: 99,
          label: '$_duelCommandment%',
          // onChanged: widget.onChangedSlide,
          onChanged: (double newValue) {
            // widget.onChangedSlide();
            setState(() {
              widget.course.confidence = newValue.round();
              _duelCommandment = newValue.round();
            });
          },
        ),
      ],
    );
  }
}
