import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationroject/view/splash_and_onboard/OnBoard.dart';

class SplashScreen extends StatefulWidget {
  static const String routName = "SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState()
  {
    super.initState();
    Timer(
      Duration(seconds: 5),
        ()=>Navigator.pushReplacement(context, MaterialPageRoute
          (builder: (context)=> OnBoardScreen()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //alignment: Alignment.center,
        children: [
          Container(
          // height: 700,
          // width: 701.31,
     alignment: Alignment.center,
      decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/Blur.png"),
                  fit: BoxFit.cover
            )),
          ),
          Container(

            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Logo (1).png"),
              ),
            ),
          ),

      // Container(
      //         alignment: Alignment.b,
      //         decoration: BoxDecoration(
      //             image: DecorationImage(
      //               image: AssetImage("assets/images/Home Indicator.png"),
      //             )
      //         ),
      //       ),

        ], //children of stack
      ),

     // bottomNavigationBar:Container(
     //     // alignment: Alignment.topRight,
     //      decoration: BoxDecoration(
     //          image: DecorationImage(
     //            image: AssetImage("assets/images/Home Indicator.png"),
     //          )
     //      ),
     //    ),
     // child:
      // Column(
      //   children: [
      //     Container(
      //       alignment: Alignment.topRight,
      //       decoration: BoxDecoration(
      //           image: DecorationImage(
      //             image: AssetImage("assets/images/Home Indicator.png"),
      //           )
      //       ),
      //     ),
      //   ],
      // ),


    );
  }
}
