import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade900,
  primarySwatch: Colors.teal,
  fontFamily: 'Poppins',
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.black,
    elevation: 0.0,
    //toolbarHeight: 120.h,
    actionsIconTheme: const IconThemeData(
      size: 25,
      color: Colors.orangeAccent,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white, //myDefaultColor,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.grey.shade900),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey.shade900,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 20,
    backgroundColor: Colors.black12,
    unselectedIconTheme: const IconThemeData(color: Colors.white),
    unselectedItemColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: kPrimaryColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 22.0,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white, //Colors.black,
      fontSize: 18.0,
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
);
