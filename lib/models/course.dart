import 'package:meta/meta.dart';

class Course{
  final int id;
  final String companyName;
  final String companyPictureUrl;
  final String courseName;
  final String coursePictureUrl;
  final int maxNoOfStudent;
  final String location;
  final String descreption;
  final int noOfHours;
  final int noOfWeeks;
  final String qualification;

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