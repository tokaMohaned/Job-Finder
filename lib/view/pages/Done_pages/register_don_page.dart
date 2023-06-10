import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../customeWidget/Done_page.dart';
import '../../registration_and_login/Login.dart';
import '../home/homeScreen.dart';

class Register_Done_page extends StatelessWidget {
  static const String routName="Register_Done_page";

  const Register_Done_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Done_page(
        imagePath: "assets/images/Success Account Ilustration.png",
        title1: "Your account has been set up!",
        title2:"We have customized feeds according to your preferences",
        titleButton: "Get Started",
        onTap: (){
          Navigator.pushNamed(context, LoginScreen.routName);
        },




      ),

    );
  }
}
