import 'package:first_mission/shared/components.dart';
import 'package:flutter/material.dart';
class HomeScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: defaultHeadText('Welcome To Home Screen'),
        ),
      ),
    );
  }
}
