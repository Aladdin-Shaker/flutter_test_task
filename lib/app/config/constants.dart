import 'package:flutter/material.dart';

// routes
const String landingViewRoute = '/';
const String undefiendRoute = '/undefiend';

// colors
const kPrimaryColor = Color(0xFF2d8cff);
const kSecondaryColor = Color.fromARGB(255, 211, 224, 240);
const kTitleColor = Color.fromARGB(255, 19, 21, 25);
const kSubTitleColor = Color.fromARGB(255, 141, 143, 147);
const kBkGroundColor = Color.fromARGB(255, 225, 229, 238);
const kUploadColor = Color.fromARGB(159, 4, 195, 43);

// widget raduis
const double kCardRaduis = 25.0;
const double kCircleAvatarRaduis = 10.0;

// spaces between sections
const double kSectionsSpace = 100.0;

// padding standard
const double kPadding = 15.0;

// marging standard
const double kMarging = 20.0;

// font sizes standard
const double kh1Size = 25.0;
const double kh2Size = 22.0;
const double kh3Size = 18.0;
const double kh4Size = 14.0;
const double kh5Size = 12.0;
const double kh6Size = 10.0;

// Text title style
const titleStyle = TextStyle(
  color: kTitleColor,
  fontSize: kh3Size,
  fontWeight: FontWeight.w800,
);

// Text sub title style
const subTitleStyle = TextStyle(
  color: kTitleColor,
  fontSize: kh4Size,
  fontWeight: FontWeight.w300,
);

// max file size to upload in bytes
const int fileMaxSize = 2097152; // 2 MB

// allowed files types
const List<String> filesTypes = ['jpg', 'png', 'pdf', 'doc'];
