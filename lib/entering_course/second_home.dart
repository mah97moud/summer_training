import 'package:flutter/material.dart';
import 'package:new_app/entering_course/sceondary_info.dart';
import 'package:new_app/models/course.dart';

import 'basics_info.dart';

class SecondHome extends StatelessWidget {
  Course ourCourse = new Course(
      id: null,
      companyName: null,
      companyPictureUrl: null,
      courseName: null,
      coursePictureUrl: null,
      maxNoOfStudent: null,
      location: null,
      descreption: null,
      noOfHours: null,
      noOfWeeks: null,
      qualification: null);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPageInfo(
              course: ourCourse,
            ),
        '/second': (context) => SecondPageInfo(
              course: ourCourse,
            ),
      },
    );
  }
}
