import 'package:first_mission/modules/layout/Homescreen.dart';
import 'package:first_mission/modules/password/forgotPassword_Screen.dart';
import 'package:first_mission/modules/signup/Signup_Screen.dart';
import 'package:first_mission/modules/signup/cubit.dart';
import 'package:first_mission/modules/signup/state.dart';
import 'package:first_mission/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:first_mission/shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentCubit , CurrentStates>(
      listener: (context , state){
        if(state is CurrentLoading){
          buildProgress(
            context: context,
            text: 'Login....'
          );
        }
        if(state is CurrentSuccess){
          finishNavigate(context , HomeScreen());
        }
      } ,
      builder: (context , state){
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 80.0),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child : defaultHeadText('login')
                    ),
                  ),
                  SizedBox(height: 95.0,),
                  defaultTextForm(controller: emailController,
                      hint: 'amrnasser@gamil.com',
                      title: 'Email',
                      type: TextInputType.emailAddress
                  ),
                  SizedBox(height: 15.0,),
                  defaultTextForm(controller: passwordController,
                      hint: '************',
                      title: 'Password',
                      obscureText: true,
                      type: TextInputType.number
                  ),
                  SizedBox(height: 45.0,),
                  defaultFlatBotton(
                      text: 'Login',
                      function: (){
                        CurrentCubit.get(context).Login(
                          password: SignScreen().passwordController.text,
                          email: SignScreen().emailController.text
                        );
                      }
                  ),
                  SizedBox(height: 15.0,),
                  defaultFlatBotton(
                      text: 'Sign up',
                      function: (){navigate(context, SignScreen());}
                  ),
                  SizedBox(height: 25.0,),
                  InkWell(
                    onTap: (){navigate(context, ForgotScreen());},
                    child: defaultCaptionText('Forgot your password ?'),
                  )
                ],
              ),
            ),
          ),
        );
      } ,
    );
  }
}
