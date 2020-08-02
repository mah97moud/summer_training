import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:new_app/models/course.dart';

import 'cut_colored_image.dart';

class CourseDetailHeader extends StatefulWidget {
  final Course course;
  final Object id;

  CourseDetailHeader(
    this.course, {
    @required this.id,
  });

  @override
  _CourseDetailHeaderState createState() => new _CourseDetailHeaderState();
}

class _CourseDetailHeaderState extends State<CourseDetailHeader> {
  static const BACKGROUND_IMAGE = 'images/Background-Image.jpg';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var screenwidth = MediaQuery.of(context).size.width;

    var diagonalBackground = new DiagonallyCutColoredImage(
      new Image.asset(
        BACKGROUND_IMAGE,
        width: screenwidth,
        height: 280.0,
        fit: BoxFit.cover,
      ),
      color: const Color(0xBB42A5F5),
    );

    var avatar = new Hero(
      tag: widget.id,
      child: new CircleAvatar(
        backgroundImage: AssetImage(widget.course.companyPictureUrl),
        radius: 75.0,
      ),
    );

    var peopleInfo = new Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(
            Icons.people,
            color: Colors.black,
            size: 24.0,
          ),
          new Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: new Text(
                widget.course.maxNoOfStudent.toString(),
                style: textTheme.subhead.copyWith(color: Colors.black),
              )),
          new Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: new Text(
                "Students",
                style: textTheme.subhead.copyWith(color: Colors.black),
              ))
        ],
      ),
    );

    var actionButtons = new Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new MaterialButton(
              minWidth: 140.0,
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () async {
                //TODO Handle Adopt
              },
              child: new Text('ENROL NOW'),
            ),
          ),
        ],
      ),
    );

    return new Stack(
      children: [
        diagonalBackground,
        new Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.4,
          child: new Column(
            children: [
              avatar,
              peopleInfo,
              actionButtons,
            ],
          ),
        ),
        new Positioned(
          top: 26.0,
          left: 4.0,
          child: new BackButton(color: Colors.black),
        ),
      ],
    );
  }
}
