import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utilites/AppAssets.dart';
import '../customeWidget/defaulit_form_field.dart';
import '../customeWidget/main_button.dart';
import 'Done_pages/forget_password_done_page.dart';
import 'Login.dart';

class ForgetPassword extends StatelessWidget {
  static const String routName = "ForgetPassword";

   ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey =GlobalKey<FormState>();

    var emailController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          Container(
            height: 22.h,
            width: 22.w,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Logo.png",
                  ),
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key:formKey,
          child: Column(children: [
             SizedBox(
              height: 4.h,
            ),
            Container(
              alignment: Alignment.topLeft,
              child:  Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 26.sp,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Column(
                children:  [
                  SizedBox(height: 2.h),
                  Text(
                    "Enter the email address you used when you joined and we’ll"
                        " send you instructions to reset your password.",
                    style: TextStyle(
                      fontSize: 11.5.sp,
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: 2.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultFormField(//email
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'enter email';
                  }
                  if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9]+.[a-z]").
                  hasMatch(value)){
                    return "please enter valid mail";
                  }
                  else {return null;}
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                labelText:"Enter your email..." ,
                prefixIcon: const Icon(Icons.email_outlined),
                inputEnabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF9CA3AF)),
                 borderRadius: BorderRadius.circular(10),

                ),
                inputFocusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),

              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text("You remember your password",style: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 12.sp,
                ),),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.routName); },
                    child:  Text("Login",style:
                    TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xFf3366FF),
                    ),)),
              ],
            ),


            SizedBox(height: .5.h,),
            MainButton(
              text: 'Request password reset',
              onTap: () {
               if(formKey.currentState!.validate())
               {
                  Navigator.pushNamed(context, ForgetPasswordDone_page.routName);
                  print(emailController);
                }
            },),
            SizedBox(height: 2.h),
            Image(image: AssetImage(AppAssets.homeIndicator),),
          ]),
        ),
      ),
    );
  }
}
