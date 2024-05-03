
import 'package:flutter/material.dart';
import 'package:news_app/core/config/pages_route_name.dart';
import 'package:news_app/core/widgets/custom_background.dart';
import 'package:news_app/main.dart';

class SplashView extends StatefulWidget {

  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState(){
    Future.delayed(const Duration(seconds:2),
          () =>navigatorkey.currentState!.pushReplacementNamed(
          PagesRouteName.homeView
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
child: Image.asset("assets/images/logo.png"),
    );
  }
}
