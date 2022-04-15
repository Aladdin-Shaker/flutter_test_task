import 'package:flutter/material.dart';
import 'package:test_task/app/config/constants.dart';
import 'package:test_task/app/config/sizes.dart';

Container fileDetailsContainer({
  required String title,
}) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: kSubTitleColor,
    ),
    child: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: getProportionateScreenWidth(12),
      ),
    ),
  );
}
