import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: AnimatedSplashScreen(
          duration: 1000,
          splash: Image.asset('assets/logo.png',),
          nextScreen: HomePage(),
          splashTransition: SplashTransition.decoratedBoxTransition,

          splashIconSize: 500,

      )
    );
  }
}
