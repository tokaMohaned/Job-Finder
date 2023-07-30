import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationroject/controller/local/sharedPreference.dart';
import 'package:graduationroject/controller/logic/cubit/job_cubit.dart';
import 'package:graduationroject/controller/remote/dio/dio_helper.dart';
import 'package:graduationroject/view/pages/Done_pages/forget_password_done_page.dart';
import 'package:graduationroject/view/pages/Done_pages/register_don_page.dart';
import 'package:graduationroject/view/pages/Done_pages/reset_done.dart';
import 'package:graduationroject/view/pages/home/home.dart';
import 'package:graduationroject/view/registration_and_login/Login.dart';
import 'package:graduationroject/view/registration_and_login/prefered_location.dart';
import 'package:graduationroject/view/registration_and_login/register.dart';
import 'package:graduationroject/view/registration_and_login/work_type.dart';
import 'package:graduationroject/view/search_screen/searchScreen.dart';
import 'package:graduationroject/view/search_screen/search_view_filter.dart';
import 'package:graduationroject/view/splash_and_onboard/OnBoard.dart';
import 'package:graduationroject/view/pages/reset_password/change_password.dart';
import 'package:graduationroject/view/pages/reset_password/forget_password.dart';
import 'package:graduationroject/view/pages/home/BottomNavBar.dart';
import 'package:graduationroject/view/pages/reset_password/main_emailAdress.dart';
import 'package:graduationroject/view/pages/reset_password/reset_password.dart';
import 'package:graduationroject/view/splash_and_onboard/splash.dart';

import 'package:sizer/sizer.dart';

import 'constant/bloc_observer.dart';

void main() async
{

  // await DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized(); //it is for sharedpreference
  await MyCache.init();
  Bloc.observer=MyBlocObserver();
  DioHelper.init();
  runApp(
      DevicePreview(
        enabled:true,
        builder: (context)=> MyApp(),
      )
     );

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JobCubit()..currentIndexs,
      //2 dots mean i make obj and call function
      child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              //useInheritedMediaQuery: true,
             locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              //title: 'Flutter Demo',
              // theme: ThemeData(
              //   primarySwatch: Colors.blue,
              // ),
              initialRoute: HomePage.routName, //first page will appear
              routes: {
                // test.routName:(context)=>test(),


                SplashScreen.routName: (context) => SplashScreen(),
                OnBoardScreen.routName: (context) => OnBoardScreen(),

                RegitrationScreen.routName: (context) => RegitrationScreen(),
                Register_Done_page.routName: (context) => Register_Done_page(),

                Work_Type.routName: (context) => Work_Type(),
                Prefered_location.routName: (context) => Prefered_location(),


                LoginScreen.routName: (context) => LoginScreen(),

                BottomNavBar.routName: (context) => BottomNavBar(),
                HomePage.routName: (context) => HomePage(),




                ForgetPassword.routName: (context) => ForgetPassword(),
                ForgetPasswordDone_page.routName: (context) =>
                    ForgetPasswordDone_page(),
                Rest_password.routName: (context) => Rest_password(),
                DoneResetPass.routName: (context) => DoneResetPass(),

                MainEmailAdress.routName: (context) => MainEmailAdress(),
                ChangePassword.routName: (context) => ChangePassword(),

                SearchScreen.routName: (context) => SearchScreen(),
                SearchViewFilter.routName: (context) => SearchViewFilter(),




              },
            );
          } //sizer bulder
      ),
    );
  } //bulder
} //MyApp

