import 'package:flutter/material.dart';

double height(context) => MediaQuery.of(context).size.height;

double width(context) => MediaQuery.of(context).size.width;

void navigateTo(context, screen) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return screen;
        },
      ),
    );

void navigateToFinish(context, screen) =>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return screen;
    }), (route) => false);

void navigatorTo(context, String screen) =>
    Navigator.pushNamed(context, screen);

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(context,
    {required String text}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
