import 'package:first_mission/modules/layout/Homescreen.dart';
import 'package:first_mission/modules/password/forgotPassword_Screen.dart';
import 'package:first_mission/modules/signup/cubit.dart';
import 'package:first_mission/modules/signup/state.dart';
import 'package:first_mission/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignScreen extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentCubit , CurrentStates>(
        listener: (context , state){
          if(state is CurrentLoading){
              buildProgress(
                context: context,
                text: 'Loading...'
              );
          }
          if(state is CurrentSuccess){
            finishNavigate(context , HomeScreen());
          }
          if(state is CurrentError)
          {
            buildProgress(
              context: context,
              text: state.error.toString(),
            );
          }
        },
      builder: (context , state){
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 60),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: defaultHeadText('SignUP'),
                      ),
                    ),
                    SizedBox(height: 55,),
                    defaultTextForm(
                        hint: 'Amr' ,
                        title: 'First Name' ,
                        controller: firstNameController,
                        type: TextInputType.name
                    ),
                    SizedBox(height: 15.0,),
                    defaultTextForm(
                        hint: 'Nasser' ,
                        title: 'Last Name' ,
                        controller: lastNameController,
                        type: TextInputType.name
                    ),
                    SizedBox(height: 15.0,),
                    defaultTextForm(
                        hint: 'amrnasser@gmail.com' ,
                        title: 'Email' ,
                        controller: emailController,
                        type: TextInputType.emailAddress
                    ),
                    SizedBox(height: 15.0,),
                    defaultTextForm(
                      hint: '*******' ,
                      title: 'Password' ,
                      controller: passwordController,
                      obscureText: true,
                      type: TextInputType.number,
                    ),
                    SizedBox(height: 15.0,),
                    defaultTextForm(
                        hint: 'Cairo' ,
                        title: 'city' ,
                        controller:cityController ,
                        type: TextInputType.name
                    ),
                    SizedBox(height: 35.0,),
                    defaultFlatBotton(
                        text: 'signup',
                        function: (){
                          CurrentCubit.get(context).register(
                            first: firstNameController.text,
                            last: lastNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            city: cityController.text,
                          );
                        }
                    ),
                    SizedBox(height: 15.0,),
                    defaultFlatBotton(
                        text: 'Login',
                        function: (){print('Login');}
                    ),
                    SizedBox(height: 25.0,),
                    InkWell(
                        onTap: (){navigate(context, ForgotScreen());},
                        child: defaultCaptionText('Forgot your password ?')
                    ),
                  ],
                ),
              ),
            ),
          );
      },
    );
  }
}