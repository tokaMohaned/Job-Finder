import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../customeWidget/Done_page.dart';
import '../home/homeScreen.dart';

class DoneResetPass extends StatelessWidget {
  static const String routName = "DoneResetPass";

  const DoneResetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Done_page(
        imagePath: "assets/images/Email Ilustration.png",
        title1: "Password changed succesfully!",
        title2:"Your password has been changed successfully, we will let you know if there are more problems with your account" ,
        titleButton: "open email app",
        onTap: (){
          Navigator.pushNamed(context, HomeScreen.routName);
        },




      ),

    );
  }
}
