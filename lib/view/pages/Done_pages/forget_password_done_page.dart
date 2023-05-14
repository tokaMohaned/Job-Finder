import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../customeWidget/Done_page.dart';
import '../../customeWidget/main_button.dart';
import '../../registration_and_login/Login.dart';
import '../reset_password/reset_password.dart';

class ForgetPasswordDone_page extends StatelessWidget {
  static const String routName="ForgetPasswordDone_page";
 ForgetPasswordDone_page({Key? key}) : super(key: key);
  //Done_page done_pageModel;
  //ForgetPasswordDone_page(this.done_pageModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Done_page(
            imagePath: "assets/images/Email Ilustration.png",
            title1: "Check your Email",
            title2:"We have sent a reset password to your email address" ,
            titleButton: "open email app",
            onTap: (){
              Navigator.pushNamed(context, Rest_password.routName);
            },




          ),




    );
  }
}
