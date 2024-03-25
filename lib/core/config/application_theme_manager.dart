import 'package:flutter/material.dart';

class ApplicationThemeManager{
  static ThemeData applicationThemeData=
  ThemeData(
      primaryColor: const Color(0xFF39A552),
      scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF39A552),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight:Radius.circular(50),
          bottomLeft:Radius.circular(50),
        )
      ),
      iconTheme:IconThemeData(
        color: Colors.white,
        size: 35,
      )
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white,
      ),
     bodyLarge: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.w500,
        fontSize: 22,
        color: Colors.white,
      ),
     bodySmall: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontFamily: "Exo",
        fontWeight: FontWeight.w500,
        fontSize: 10,
        color: Colors.white,
      ),
    ),
  );
}