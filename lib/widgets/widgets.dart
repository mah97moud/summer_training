import 'package:flutter/material.dart';
import 'package:new_app/cource_details/details_page.dart';
import 'package:new_app/models/course.dart';
import 'package:new_app/services/login_with_google.dart';

import '../colors.dart';
import '../home.dart';
import '../routs.dart';

Widget buildFormFile(
  String textvalue,
  TextEditingController controller,
  bool securty,
  IconData icon,
) {
  return TextFormField(
    controller: controller,
    obscureText: securty,
    cursorColor: sSDarkRed,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(
        left: 30,
      ),
      filled: true,
      labelText: textvalue,
      icon: Icon(
        icon,
        color: sSLightRed,
      ),
      labelStyle: TextStyle(
        color: Color.fromRGBO(117, 117, 117, 1),
        fontWeight: FontWeight.bold,
        fontSize: 18,
        fontFamily: "Segoe",
      ),
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(100.0),
        ),
      ),
    ),
    validator: (String value) {
      if (value.isEmpty) {
        return 'Please enter your ${textvalue}';
      }
      return null;
    },
  );
}

Widget buildButtonBar(BuildContext context) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Text(
          "Login With",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25.0, color: Colors.deepOrange),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      ButtonBar(
        mainAxisSize: MainAxisSize.min,
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 40.0),
            child: FloatingActionButton(
              heroTag: 'google',
              onPressed: () {
                signInWithGoogle().whenComplete(() => {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }))
                    });
              },
              child: CircleAvatar(
                backgroundImage: AssetImage("images/google.png"),
                radius: 20,
                backgroundColor: Colors.transparent,
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget cardCircularImage(String path) {
  return Padding(
    padding: const EdgeInsets.only(left: 0.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        backgroundImage: AssetImage(path),
        radius: 50.0,
        backgroundColor: Colors.transparent,
      ),
    ),
  );
}

Widget cardTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 15.0,
    ),
    child: Text(
      title ?? "defualt Title",
    ),
  );
}

Widget cardText(String text) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 15.0,
      top: 10.0,
    ),
    child: SizedBox(
      width: 190,
      height: 80,
      child: Text(
        text ?? "defualt card Text",
        softWrap: true,
        overflow: TextOverflow.fade,
      ),
    ),
  );
}

Widget cardButton(BuildContext context, Course course, Object id) {
  return Padding(
    padding: const EdgeInsets.only(right: 15.0),
    child: RaisedButton(
      onPressed: () {
        Navigator.of(context).push(
          new FadePageRoute(
            builder: (c) {
              return new CourseDetailsPage(course, id: id);
            },
            settings: RouteSettings(),
          ),
        );
      },
      child: Text("More Details"),
    ),
  );
}
