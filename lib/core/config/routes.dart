import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/pages_route_name.dart';
import 'package:news_app/core/home/pages/home_view.dart';
import 'package:news_app/core/pages/splash/pages/splash_view.dart';
import 'package:news_app/core/settings/pages/settings_view.dart';

class Routes{
static Route<dynamic>onGenerateRoute(RouteSettings settings ){
   switch(settings.name){
     case PagesRouteName.initial:
       return MaterialPageRoute(
           builder: (context) => const SplashView(),
         settings: settings
       );
     case PagesRouteName.homeView:
       return MaterialPageRoute(
           builder: (context) => const HomeView(),
           settings: settings
       );
     case PagesRouteName.settingsView:
       return MaterialPageRoute(
           builder: (context) => const SettingView(),
           settings: settings
       );
     default:
       return MaterialPageRoute(
         builder: (context) => const SplashView(),
         settings: settings
     );
   }

    }
}