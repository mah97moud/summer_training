import 'package:flutter/material.dart';
import 'package:new_app/colors.dart';
import 'package:new_app/cource_details/footer/requirements_page.dart';
import 'package:new_app/models/course.dart';

import 'description_page.dart';
import 'duration_page.dart';

class CourseShowcase extends StatefulWidget {
  final Course course;

  CourseShowcase(this.course);

  @override
  _CourseShowcaseState createState() => new _CourseShowcaseState();
}

class _CourseShowcaseState extends State<CourseShowcase>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      new Tab(text: 'Description'),
      new Tab(text: 'Requirements'),
      new Tab(text: 'Duration')
    ];
    _pages = [
      new DescriptionPage(widget.course),
      new RequirementsPage(widget.course),
      new DurationPage(widget.course)
    ];
    _controller = new TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          new TabBar(
            controller: _controller,
            tabs: _tabs,
            indicatorColor: sPrimaryOrange,
          ),
          new SizedBox.fromSize(
            size: const Size.fromHeight(200.0),
            child: new TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}
