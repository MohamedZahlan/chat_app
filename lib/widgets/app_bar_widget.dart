import 'package:flutter/material.dart';

AppBar buildAppBar(
  BuildContext context,
  String text,
  Widget leading, [
  List<Widget>? actions,
]) {
  return AppBar(
    centerTitle: true,
    leading: leading,
    title: Text(
      text,
    ),
    actions: actions,
  );
}
