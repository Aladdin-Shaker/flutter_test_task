import 'package:flutter/material.dart';
import 'package:test_task/app/config/constants.dart';

ThemeData buildThemeData() {
  return ThemeData(
    // scaffoldBackgroundColor: kbackGroundColor,
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: kSecondaryColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: _appBarTheme(),
    textTheme: _textTheme(),
    inputDecorationTheme: _buildTextInput(),
  );
}

InputDecorationTheme _buildTextInput() {
  return const InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: kPrimaryColor,
        width: 0,
      ),
    ),
  );
}

AppBarTheme _appBarTheme() {
  return const AppBarTheme(
    elevation: 0.6,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: kTitleColor,
    ),
  );
}

TextTheme _textTheme() {
  return const TextTheme();
}
