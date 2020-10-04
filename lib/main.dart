import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final signInPage = SignInPage();   instance of SignInPage()
    // signInPage.buildContent();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LandingPage(),
    );
  }
}
