import 'package:flutter/material.dart';
import 'package:new_app/create-account.dart';

import 'colors.dart';
import 'entering_course/basics_info.dart';
import 'entering_course/sceondary_info.dart';
import 'home.dart';
import 'login.dart';
import 'models/course.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      qualification: null,
    );

    return MaterialApp(
      title: 'Summer Training',
      theme: _summerTrainingTheme,
      home: Scaffold(
        body: HomePage(),
      ),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      routes: {
        '/login': (context) => LoginPage(),
        '/createAcount': (context) => CreateAccount(),
        '/homePage': (context) => HomePage(),
        '/first': (context) => FirstPageInfo(
              course: ourCourse,
            ),
        '/second': (context) => SecondPageInfo(
              course: ourCourse,
            ),
      },
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') return null;
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

final ThemeData _summerTrainingTheme = _buildSummerTrainingTheme();

ThemeData _buildSummerTrainingTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: sWhiteText,
    primaryColor: sPrimaryOrange,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: sSecondaryRed,
      colorScheme: base.colorScheme.copyWith(
        // textColor on Button
        secondary: sWhiteText,
      ),
    ),
    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.accent,
    ),
    scaffoldBackgroundColor: sWhiteBackground,
    cardColor: sCardColor,
    textSelectionColor: sBlackText,
    errorColor: sSecondaryRed,
    // TODO: Add the text themes
    textTheme: _buildSummerTrainingTextTheme(base.textTheme),
    primaryTextTheme: _buildSummerTrainingTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildSummerTrainingTextTheme(base.accentTextTheme),
    // TODO: Add the icon themes
    primaryIconTheme: base.iconTheme.copyWith(
      color: sBlackText,
    ),
    // TODO: Decorate the inputs
  );
}

// TODO: Build Text Theme

TextTheme _buildSummerTrainingTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 18.0,
        ),
      )
      .apply(
        fontFamily: 'Segoe',
        displayColor: sBlackText,
        bodyColor: sBlackText,
      );
}
