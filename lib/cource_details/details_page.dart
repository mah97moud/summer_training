import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:new_app/models/course.dart';

import '../colors.dart';
import 'details_body.dart';
import 'footer/details_footer.dart';
import 'header/details_header.dart';

class CourseDetailsPage extends StatefulWidget {
  final Course course;
  final Object id;

  CourseDetailsPage(
    this.course, {
    @required this.id,
  });

  @override
  _CourseDetailsPageState createState() => new _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = new BoxDecoration(
      gradient: new LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: [
          sCardColor,
          sCardColor,
        ],
      ),
    );

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          decoration: linearGradient,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new CourseDetailHeader(
                widget.course,
                id: widget.id,
              ),
              new Padding(
                padding: const EdgeInsets.all(24.0),
                child: new CourseDetailBody(widget.course),
              ),
              new CourseShowcase(widget.course),
            ],
          ),
        ),
      ),
    );
  }
}
