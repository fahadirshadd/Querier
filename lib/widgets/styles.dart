import 'package:flutter/material.dart';

TextStyle kPageTitleStyle = const TextStyle(
  fontSize: 16.0,
  color: Colors.black,
  fontFamily: "raleway",
);
Color light = const Color(0xfff7f8fc);
Color lightGrey = const Color(0xffa4a6b3);
Color dark = const Color(0xff363740);
Color active = const Color(0xff3c19c0);
Color primaryColor = const Color(0xff24b04b);
const kPrimaryColor = Color(0xffDFDFDF);
const kDarkBlackColor = Color(0xFF191919);
const kBgColor = Color(0xFFE7E7E7);
const kBodyTextColor = Color(0xFF666666);
const kDefaultPadding = 20.0;
const kMaxWidth = 1232.0;
const kDefaultDuration = Duration(milliseconds: 250);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);
// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;
