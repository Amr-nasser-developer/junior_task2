import 'package:first_mission/modules/login/login_screen.dart';
import 'package:first_mission/modules/signup/Signup_Screen.dart';
import 'package:first_mission/shared/color.dart';
import 'package:first_mission/shared/components.dart';
import 'package:first_mission/shared/remote/DioHelper.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             defaultHeadText('''Welcome To
    Courses'''),
             SizedBox(height: 15.0,),
             Image(image: AssetImage('assets/images/main_logo.png')),
             SizedBox(height:45.0),
             defaultFlatBotton(
               text: ('login'),
               function: (){
                 navigate(context, LoginScreen());
               }
             ),
             SizedBox(height: 15.0,),
             defaultFlatBotton(
                 text: ('register'),
                 function: (){
                   navigate(context, SignScreen());
                   // DioHelper.postData(
                   //   path: 'lms/api/v1/auth/signup-save',
                   //   data: {
                   //     'first_name':'amr',
                   //     'last_name': 'nasser',
                   //     'email':'amr@gmail.com',
                   //     'password' : '123456789',
                   //     'city' : 'cairo'
                   //   },
                   // ).then((value) {print(value.data);});
                 }
             ),
             SizedBox(height: 15.0,),
             defaultCaptionText('Or Login With'),
             SizedBox(height:15.0 ,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 CircleAvatar(
                   backgroundColor: defaultColor,
                   child: defaultImageLogo('assets/images/google.png',)
                 ),
                 SizedBox(width: 15.0,),
                 CircleAvatar(
                   backgroundColor: defaultColor,
                   child: defaultImageLogo('assets/images/facebook.png',)
                 ),
               ],
             )
           ],
         ),
      ),
    )
    );
  }
}

