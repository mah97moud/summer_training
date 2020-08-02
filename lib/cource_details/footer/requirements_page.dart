import 'package:flutter/material.dart';
import 'package:new_app/models/course.dart';

class RequirementsPage extends StatelessWidget {
  final Course course;
  RequirementsPage(this.course);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Center(
      child: new Text(
        course.qualification,
        textAlign: TextAlign.center,
        style: textTheme.subhead,
      ),
    );
  }
}
