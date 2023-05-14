import 'package:flutter/material.dart';
import 'package:graduationroject/controller/local/sharedPreference.dart';
import 'package:graduationroject/controller/remote/dio/dio_helper.dart';
import 'package:graduationroject/view/pages/Done_pages/forget_password_done_page.dart';
import 'package:graduationroject/view/pages/Done_pages/register_don_page.dart';
import 'package:graduationroject/view/pages/Done_pages/reset_done.dart';
import 'package:graduationroject/view/registration_and_login/Login.dart';
import 'package:graduationroject/view/registration_and_login/prefered_location.dart';
import 'package:graduationroject/view/registration_and_login/register.dart';
import 'package:graduationroject/view/registration_and_login/work_type.dart';
import 'package:graduationroject/view/splash_and_onboard/OnBoard.dart';
import 'package:graduationroject/view/pages/reset_password/change_password.dart';
import 'package:graduationroject/view/pages/reset_password/forget_password.dart';
import 'package:graduationroject/view/pages/homeScreen.dart';
import 'package:graduationroject/view/pages/reset_password/main_emailAdress.dart';
import 'package:graduationroject/view/pages/reset_password/reset_password.dart';
import 'package:graduationroject/view/splash_and_onboard/splash.dart';

import 'package:sizer/sizer.dart';

void main()
async
{
 // await DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await MyCache.init();

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
          initialRoute:  RegitrationScreen.routName,//first page will apear
          routes: {
           // test.routName:(context)=>test(),


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

            MainEmailAdress.routName:(context)=>MainEmailAdress(),
            ChangePassword.routName:(context)=>ChangePassword(),















          },
        );
      }//sizer bulder
    );
  }//bulder
}//MyApp

