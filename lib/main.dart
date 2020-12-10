import 'package:first_mission/modules/login/login_screen.dart';
import 'package:first_mission/modules/password/forgotPassword_Screen.dart';
import 'package:first_mission/modules/signup/Signup_Screen.dart';
import 'package:first_mission/modules/signup/cubit.dart';
import 'package:first_mission/modules/welcome/welcome_screen.dart';
import 'package:first_mission/shared/color.dart';
import 'package:first_mission/shared/remote/DioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DioHelper();
    return BlocProvider(
      create: (BuildContext context)=> CurrentCubit(),
      child: MaterialApp(
        title: 'Flutter Mission',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: defaultColor,
          ),
          scaffoldBackgroundColor: Colors.grey[200]
        ),
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}

