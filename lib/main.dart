import 'package:flutter/material.dart';
import 'package:graduationroject/controller/remote/dio/dio_helper.dart';
import 'package:graduationroject/view/pages/Done_pages/forget_password_done_page.dart';
import 'package:graduationroject/view/pages/Done_pages/register_don_page.dart';
import 'package:graduationroject/view/pages/Done_pages/reset_done.dart';
import 'package:graduationroject/view/pages/Login.dart';
import 'package:graduationroject/view/pages/OnBoard.dart';
import 'package:graduationroject/view/pages/forget_password.dart';
import 'package:graduationroject/view/pages/homeScreen.dart';
import 'package:graduationroject/view/pages/prefered_location.dart';
import 'package:graduationroject/view/pages/register.dart';
import 'package:graduationroject/view/pages/splash.dart';
import 'package:graduationroject/view/pages/reset_password.dart';
import 'package:graduationroject/view/pages/work_type.dart';
import 'package:sizer/sizer.dart';

void main()
//async
{

 // await DioHelper.init();
  runApp(const MyApp());

}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType)
      {
         return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          // ),
          initialRoute:  Work_Type.routName,//first page will apear
          routes: {
            SplashScreen.routName:(context)=>SplashScreen(),
            OnBoardScreen.routName:(context)=>OnBoardScreen(),

            RegitrationScreen.routName:(context)=>RegitrationScreen(),
            Register_Done_page.routName:(context)=>Register_Done_page(),

            LoginScreen.routName:(context)=>LoginScreen(),

            HomeScreen.routName:(context)=>HomeScreen(),

            Work_Type.routName:(context)=>Work_Type(),
            Prefered_location.routName:(context)=>Prefered_location(),

            ForgetPassword.routName:(context)=>ForgetPassword(),
            ForgetPasswordDone_page.routName:(context)=>ForgetPasswordDone_page(),
            Rest_password.routName:(context)=>Rest_password(),
            DoneResetPass.routName:(context)=>DoneResetPass(),








          },
        );
      }//sizer bulder
    );
  }//bulder
}//MyApp

