import 'package:flutter/material.dart';

AppBar customAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    automaticallyImplyLeading: true,
    titleSpacing: 0,
    elevation: 0.6,
    leading: leading,
    title: title,
    primary: true,
    centerTitle: true,
  );
}
