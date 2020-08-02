import 'package:flutter/material.dart';
import 'package:new_app/models/course.dart';

class DurationPage extends StatelessWidget {
  final Course course;
  DurationPage(this.course);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: new Column(
          children: <Widget>[
            new Text(
              "Number of Hours",
              style: textTheme.headline5,
            ),
            new Padding(padding: const EdgeInsets.only(top: 8.0)),
            new Text(
              course.noOfHours.toString() + " Hourse.",
              style: TextStyle(fontSize: 20),
            ),
            new Padding(padding: const EdgeInsets.only(top: 8.0)),
            new Text(
              "Number of Weeks",
              style: textTheme.headline5,
            ),
            new Padding(padding: const EdgeInsets.only(top: 8.0)),
            new Text(
              course.noOfWeeks.toString() + " Weeks.",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ));
  }
}
