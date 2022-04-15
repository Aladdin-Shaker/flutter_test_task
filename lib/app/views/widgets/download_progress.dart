import 'package:flutter/material.dart';
import 'package:test_task/app/config/constants.dart';
import 'package:test_task/app/config/sizes.dart';

Center downloadProgress({
  required double percentage,
}) {
  return Center(
    child: Column(
      children: [
        CircularProgressIndicator(
          color: kUploadColor,
          backgroundColor: Colors.grey,
          strokeWidth: 10,
          value: percentage,
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Text(
          '$percentage %',
          style: const TextStyle(
            fontSize: kh3Size,
            fontWeight: FontWeight.bold,
            color: kUploadColor,
          ),
        ),
      ],
    ),
  );
}
