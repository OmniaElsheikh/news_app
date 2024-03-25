import 'dart:html';

import 'package:flutter/material.dart';
import 'package:news_app/core/config/application_theme_manager.dart';
import 'package:news_app/core/config/pages_route_name.dart';
import 'package:news_app/core/config/routes.dart';
GlobalKey<NavigatorState> navigatorkey =GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorkey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.applicationThemeData,
      initialRoute: PagesRouteName.initial,
      onGenerateRoute: Routes.onGenerateRoute,
      //home: const MyHomePage(title: 'Flutter Demo Home Page'
        );
  }
}

