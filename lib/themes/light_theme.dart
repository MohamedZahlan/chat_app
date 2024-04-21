import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: kPrimaryColor,
  primaryColor: kPrimaryColor,
  //HexColor('f9f8fe'), //Colors.grey.shade50, //myDefaultColor,
  indicatorColor: greenColor,
  useMaterial3: true,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
      refreshBackgroundColor: Colors.white, color: Colors.blueAccent),
  appBarTheme: const AppBarTheme(
    color: kPrimaryColor,
    elevation: 5.0,
    titleSpacing: 0,
    //toolbarHeight: 120.h,
    actionsIconTheme: IconThemeData(
      size: 28,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 22.0,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark, //Colors.white, //Colors.white
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 20,
    type: BottomNavigationBarType.fixed,
    //selectedItemColor: myDefaultColor,
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 22.0,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
    ),
    titleLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 20.0,
    ),
    titleMedium: TextStyle(
      color: kPrimaryColor, //Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      // height: 1.5,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white, //Colors.black,
      fontWeight: FontWeight.w300,
      fontSize: 15.0,
      height: 1.5,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);
