import 'dart:ui';

import 'package:flutter/Material.dart';

class CalculateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: 100,
      // width: MediaQuery.of(context).size.width * 0.4,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          "Calculate",
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
