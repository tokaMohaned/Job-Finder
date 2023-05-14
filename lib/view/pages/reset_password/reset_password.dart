import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utilites/AppAssets.dart';
import '../../customeWidget/defaulit_form_field.dart';
import '../../customeWidget/main_button.dart';
import '../Done_pages/reset_done.dart';

class Rest_password extends StatelessWidget {
  static const String routName = "Reset-password";

  const Rest_password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey=GlobalKey<FormState>();

    var passworController = TextEditingController();
    var PasswordController2 = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
        body: SizedBox(
          child: Padding(
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
              "Create new password",
              style: TextStyle(
              fontSize: 24.sp,
              ),
              ),
              ),
              Container(
              alignment: Alignment.bottomLeft,
              child: Column(
              children:  [
              SizedBox(height: 1.h),
              Text(
              "Set your new password so you can login and "
              "acces Jobsque",
              style: TextStyle(
              fontSize: 12.sp,
              ),
              ),
              ],
              ),
              ),
               SizedBox(height: 4.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:DefaultFormField(//password
                    obscureText:true,
                    obscuringChar: ".",

                    maxLines: 1,
                    // onChanged: (value) {
                    //   passController = value;
                    //   setState(() {});
                    //
                    //   },
                    validator: (value) {
                      if (value!.isEmpty) {
                      return 'enter password';
                      }
                      if(value!.length<8)
                      {
                      return
                      ("password must be at lease 8 characters");
                      }

                      },

                    controller: passworController,
                        labelText:"Enter new password" ,
                           prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon:const  ImageIcon(
                      AssetImage("assets/images/eye-slash.png")),
                    inputEnabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF9CA3AF)),
                      borderRadius: BorderRadius.circular(10),

                        ),
                        inputFocusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                        ),

              ),
              ),
                Flex(
                  direction: Axis.horizontal,
                  children: const [
                  Text("  Password must be at least 8 characters",
                    style: TextStyle(
                      color: Color(0xFF9CA3AF)
                    ),),
                  ],),



                SizedBox(height: 3.h,),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:DefaultFormField(//password
                    obscureText:true,
                    obscuringChar: ".",
                    maxLines: 1,

                    validator: (value) {
                    if(passworController.text!=value)
                      {
                        return("Both password must match");
                      }


                    },

                    controller: PasswordController2,
                    labelText:"Enter same password" ,
                    prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon:const  ImageIcon(
                          AssetImage("assets/images/eye-slash.png")),
                      inputEnabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF9CA3AF)),
                    borderRadius: BorderRadius.circular(10),

                    ),
                    inputFocusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                    ),

                    ),
                    ),

                Flex(
                  direction: Axis.horizontal,
                  children: const [
                    Text("Both password must match",
                      style: TextStyle(
                          color: Color(0xFF9CA3AF)
                      ),),
                  ],),

                const Spacer(flex: 2,),
                  SizedBox(height: .2.h,),
                  MainButton(
                  text: 'Request password reset',
                  onTap: () {
                  if(formKey.currentState!.validate()) {

                      Navigator.pushNamed(context, DoneResetPass.routName);
                    print("done");
                  }}),
                  // SizedBox(height: 2.h),
                  // Image(image: AssetImage(AppAssets.homeIndicator),),

]
    ),
          ),
          ),
        ),
    );
          }
        }
