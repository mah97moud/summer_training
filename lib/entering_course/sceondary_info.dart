import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:new_app/models/course.dart';

class SecondPageInfo extends StatelessWidget {
  Course course;
  SecondPageInfo({
    @required this.course,
  });
  final TextEditingController locationContr = new TextEditingController();
  final TextEditingController descriptContr = new TextEditingController();
  final TextEditingController qualificContr = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new ListView(
        children: <Widget>[
          SizedBox(height: 35.0),
          Center(
            child: Text(
              "More Information",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 40.0),
            child: Opacity(
              child: SizedBox(
                child: TextField(
                  controller: locationContr,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Location',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                width: 350,
              ),
              opacity: 0.6,
            ),
          ),
          SizedBox(height: 12.0),
          /*minLines: 3,maxLines: 5,Description*/
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 40.0),
            child: Opacity(
              child: SizedBox(
                child: TextField(
                  minLines: 3,
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  controller: descriptContr,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                width: 350,
              ),
              opacity: 0.6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 40.0),
            child: Opacity(
              child: SizedBox(
                child: TextField(
                  minLines: 3,
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  controller: qualificContr,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Qualification',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                width: 350,
              ),
              opacity: 0.6,
            ),
          ),
          ButtonBar(
            children: <Widget>[
              /*RaisedButton(
                child: Text('Back'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
              ),*/

              Padding(
                padding: const EdgeInsets.fromLTRB(150, 0, 150, 0),
                child: RaisedButton(
                  color: Colors.red,
                  child: Text('SUBMIT'),
                  onPressed: () {
                    course.location = locationContr.text.toString();
                    course.descreption = descriptContr.text.toString();
                    course.qualification = qualificContr.text.toString();
                    //TODO Submit Course to DataBase
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
