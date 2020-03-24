import 'dart:ui';

import 'package:flutter/Material.dart';

class GPAUnit extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:20),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black45),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Course Name',
                        contentPadding: EdgeInsets.only(left: 20)),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text(
                                "Select Unit",
                                style: TextStyle(color: Colors.black),
                              ),
                              items: <String>['1', '2', '3', '4', '5', '6', '7']
                                  .map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text(
                                "Select Grade",
                                style: TextStyle(color: Colors.black),
                              ),
                              items: <String>['A', 'B', 'C', 'D', 'E', 'F']
                                  .map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Expanded(
            child: Icon(Icons.cancel),
          )
        ],
      ),
    );
  }
}
