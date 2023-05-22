import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/homepage.dart';
import 'package:quiz_app_flutter/loginpage1.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(builder: (context, snapshot) {
      if (snapshot.hasData) {
        return HomePage();
      } else {
        return LoginPageScreen();
      }
    });
  }
}
