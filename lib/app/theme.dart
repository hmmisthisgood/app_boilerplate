import 'package:flutter/material.dart';

class CustomTheme {
  static const Color primaryColor = Color(0xffbe0101);
  static const double symmetricHozPadding = 13.0;
  static const Color lightGray = Color(0xFF707070);
  static const Color darkGray = Color(0xFF3E3E3E);

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Color(0xffbe0101),
    primaryColorDark: Color(0xffF91941),
    shadowColor: Colors.black,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
      color: Color(0xffbe0101),
    )),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Color(0xff707070)),
    bottomAppBarColor: Colors.white,
    buttonColor: Colors.white,
    fontFamily: "Montserrat",
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xFF3E3E3E),
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      headline2: TextStyle(
        color: Color(0xFF3E3E3E),
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      headline5: TextStyle(
        color: Color(0xFF3E3E3E),
      ),
      headline6: TextStyle(
        color: Color(0xFF3E3E3E),
      ),
      caption: TextStyle(
        color: Color(0xFF3E3E3E),
      ),
      button: TextStyle(
        color: Color(0xFF3E3E3E),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Montserrat",
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
      color: Color(0xffF91941),
    )),
    primaryColor: Color(0xffF91941),
    primaryColorDark: Color(0xffF91941),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Color(0xff2A3039)),
    shadowColor: Colors.white,
    bottomAppBarColor: Color(0xff1F242B),
    scaffoldBackgroundColor: Color(0xff2A3039),
    iconTheme: IconThemeData(color: Colors.white),
    buttonColor: Colors.black,
    textTheme: TextTheme(
      headline1: TextStyle(color: Color(0xFF3E3E3E)),
      headline2: TextStyle(color: Color(0xFF3E3E3E)),
      headline3: TextStyle(
        color: Colors.white,
      ),
      subtitle1: TextStyle(color: Colors.white),
      subtitle2: TextStyle(color: Colors.white),
      overline: TextStyle(color: Colors.white),
      headline4: TextStyle(
        color: Colors.white,
      ),
      headline5: TextStyle(
        color: Colors.white,
      ),
      headline6: TextStyle(
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
      ),
      bodyText1: TextStyle(color: Colors.white),
      caption: TextStyle(color: Colors.white),
      button: TextStyle(color: Colors.white),
    ),
  );
}
