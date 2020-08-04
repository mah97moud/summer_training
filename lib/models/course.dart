import 'package:meta/meta.dart';

class Course {
  int id;
  String companyName;
  String companyPictureUrl;
  String courseName;
  String coursePictureUrl;
  int maxNoOfStudent;
  String location;
  String descreption;
  int noOfHours;
  int noOfWeeks;
  String qualification;

  Course({
    @required this.id,
    @required this.companyName,
    @required this.companyPictureUrl,
    @required this.courseName,
    @required this.coursePictureUrl,
    @required this.maxNoOfStudent,
    @required this.location,
    @required this.descreption,
    @required this.noOfHours,
    @required this.noOfWeeks,
    @required this.qualification,
  });
}
