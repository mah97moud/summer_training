import 'dart:convert';
import '../models/course.dart';

class CourseApi{
  static List<Course> allCources(String jsonData){
    List<Course> cources = [];
    json.decode(jsonData)['cources'].forEach((cource)=>cources.add(_getCource(cource)));
    return cources;
  }

  static Course _getCource(Map<String,dynamic> map){
    return new Course(
      id: map['id'],
      companyName: map['company_name'], 
      companyPictureUrl: map['company_picture_url'], 
      courseName: map['course_name'], 
      coursePictureUrl: map['course_picture_url'], 
      maxNoOfStudent: map['max_no_of_student'], 
      location: map['location'], 
      descreption: map['description'],
      noOfHours: map['no_of_hours'],
      noOfWeeks: map['no_of_weeks'],
      qualification: map['qualification'],
    );
  }
}