import 'package:flutter/material.dart';
import 'package:new_app/models/course.dart';

class FirstPageInfo extends StatelessWidget {
  Course course;
  FirstPageInfo({
    @required this.course,
  });

  final TextEditingController courseNameContr = new TextEditingController();
  final TextEditingController totalHoursContr = new TextEditingController();
  final TextEditingController numberOfWeeksContr = new TextEditingController();
  final TextEditingController maxNoOfStudContr = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          SizedBox(height: 35.0),
          Center(
            child: Text(
              "Basics Information",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          SizedBox(height: 40.0),
          Text(
            "   Enternship Type :",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Opacity(
              child: SizedBox(
                child: TextField(
                  controller: courseNameContr,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Course Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                width: 350,
              ),
              opacity: 0.6,
            ),
          ),
          SizedBox(height: 28.0),
          Text(
            "   Duration of Expected time :",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Opacity(
              child: SizedBox(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: totalHoursContr,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Total Hours',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                width: 350,
              ),
              opacity: 0.6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Opacity(
              child: SizedBox(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: numberOfWeeksContr,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Number of Weeks',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                width: 350,
              ),
              opacity: 0.6,
            ),
          ),
          SizedBox(height: 28.0),
          Text(
            "   Number of student :",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Opacity(
              child: SizedBox(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: maxNoOfStudContr,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Maximum number of Students',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                width: 300,
              ),
              opacity: 0.6,
            ),
          ),
          SizedBox(height: 28.0),
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                child: Text('NEXT'),
                color: Colors.blue,
                onPressed: () {
                  course.courseName = courseNameContr.text.toString();
                  course.noOfHours = int.parse(totalHoursContr.text.toString());
                  course.noOfWeeks =
                      int.parse(numberOfWeeksContr.text.toString());
                  course.maxNoOfStudent =
                      int.parse(maxNoOfStudContr.text.toString());
                  Navigator.of(context).pushNamed('/second');
                },
              ),
              new Padding(padding: EdgeInsets.only(left: 20.0))
            ],
          ),
        ],
      ),
    );
  }
}
