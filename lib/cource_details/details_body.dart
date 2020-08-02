import 'package:flutter/material.dart';
import 'package:new_app/models/course.dart';

class CourseDetailBody extends StatelessWidget {
  final Course course;

  CourseDetailBody(this.course);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    var locationInfo = new Row(
      children: <Widget>[
        new Icon(
          Icons.place,
          color: Colors.blue,
          size: 16.0,
        ),
        new Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: new Text(
            course.location,
            style: textTheme.subtitle1.copyWith(color: Colors.black),
          ),
        )
      ],
    );

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          course.courseName,
          style: textTheme.headline2.copyWith(color: Colors.black),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: locationInfo,
        ),
      ],
    );
  }
}
