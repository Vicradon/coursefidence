import 'package:coursefidence/models/courseDS.dart';
import 'package:flutter/material.dart';

class ConfidenceSlide extends StatefulWidget {
  final CourseDS course;

  ConfidenceSlide({this.course});
  @override
  SlideState createState() => SlideState();
}

class SlideState extends State<ConfidenceSlide> {
  @override
  Widget build(BuildContext context) {
    var _duelCommandment = widget.course.confidence;

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            "Confidence level",
            style: TextStyle(fontSize: 15, color: Colors.black54),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 40,
          ),
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
