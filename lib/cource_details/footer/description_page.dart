import 'package:flutter/material.dart';
import 'package:new_app/models/course.dart';

class DescriptionPage extends StatelessWidget {
  final Course course;
  DescriptionPage(this.course);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Center(
      child: new Text(
        course.descreption,
        textAlign: TextAlign.center,
        style: textTheme.subhead,
      ),
    );
  }
}
