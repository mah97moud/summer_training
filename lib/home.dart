import 'package:flutter/material.dart';
import 'package:new_app/routs.dart';
import 'package:new_app/services/course_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/services/login_with_google.dart';
import 'package:new_app/widgets/widgets.dart';

import 'colors.dart';
import 'cource_details/details_page.dart';
import 'login.dart';
import 'models/course.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Course> _courses = [];

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  _loadCourses() async {
    String jsonData =
        await DefaultAssetBundle.of(context).loadString("assets/courses.json");
    setState(() {
      _courses = CourseApi.allCources(jsonData);
    });
  }

  bool isLogOut = false;
  void _logOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();
    setState(() {
      isLogOut = true;
    });
  }

  List<Card> _buildCardGrid(BuildContext context) {
    if (_courses == null || _courses.isEmpty) {
      return const <Card>[];
    }
    return _courses.map((course) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70.0),
          side: BorderSide(color: sPDarkOrange),
        ),
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              cardCircularImage(course.companyPictureUrl),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  cardTitle(course.companyName),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  cardTitle(course.courseName),
                                  cardText(course.descreption),
                                ],
                              ),
                            ],
                          ),
                          ButtonBar(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              cardButton(context, course, course.id),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 16.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Logout"),
                  onPressed: () {
                    _logOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Summer Training",
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print("Filter Button");
            },
            icon: Icon(
              Icons.filter_list,
            ),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 27 / 20,
        children: _buildCardGrid(context),
      ),
    );
  }
}
