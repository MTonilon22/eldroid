import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:quiz_app_flutter/widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // Remove the 'home' parameter from the theme and use it directly in MaterialApp
          ),
      home: Builder(
        builder: (BuildContext context) {
          return AnimatedSplashScreen(
            splash: Center(
              child: Transform.scale(
                scale: MediaQuery.of(context).size.width * 0.007,
                child: Image.asset(
                  'assets/sample.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            duration: 1000,
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Color(0xFFffe3b3),
            nextScreen: const WidgetTree(),
          );
        },
      ),
    );
  }
}
