import 'package:first_mission/shared/components.dart';
import 'package:flutter/material.dart';
class ForgotScreen extends StatelessWidget {
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 60),
                child: defaultHeadText('Forgot Password'),
              ),
              SizedBox(height: 200 ,),
              Container(
                alignment: Alignment.center,
                child: defaultTextForm(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                  title: 'Email',
                  hint: 'amrnasser@gmail.com'
                ),
              ),
              SizedBox(height: 200,),
              defaultFlatBotton(
                text: 'Send resend code',
                function: (){print('resend');}
              ),
              SizedBox(height: 15.0,),
              defaultFlatBotton(
                  text: 'Login',
                  function: (){print('Login');}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
