
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utilites/AppAssets.dart';
import '../customeWidget/defaulit_form_field.dart';
import '../customeWidget/main_button.dart';
import 'Done_pages/reset_done.dart';

class ChangePassword extends StatelessWidget {
  static const String routName = "ChangePassword";

  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey=GlobalKey<FormState>();

    var oldPasswordController=TextEditingController();
    var passworController = TextEditingController();
    var PasswordController2 = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:
        const BackButton(
          color: Colors.black,
        ),
        title:

        Center(
          child: Text("change password",style: TextStyle(
            color: Colors.black,

          ),
          ),
        ),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key:formKey,
            child: Column(children: [
              Align(alignment: Alignment.centerLeft,
                  child: Text("Enter your old password",textAlign: TextAlign.left,)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:DefaultFormField(//password
                  obscureText:true,
                  obscuringChar: ".",

                  maxLines: 1,
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

                  controller: oldPasswordController,
                  labelText:"Enter your old password" ,
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
              SizedBox(height: 1.h,),
               Align(alignment: Alignment.centerLeft,
                   child: Text("Enter your new password ")),

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
              // Flex(
              //   direction: Axis.horizontal,
              //   children: const [
              //     Text("  Password must be at least 8 characters",
              //       style: TextStyle(
              //           color: Color(0xFF9CA3AF)
              //       ),),
              //   ],),



              SizedBox(height: 1.h,),
              Align(alignment: Alignment.centerLeft,
                  child: Text("Enter your new password")),

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

                      //Navigator.pushNamed(context, two_step_verification.routName);
                      print("done");
                    }}),
              SizedBox(height: 2.h),
              // Image(image: AssetImage(AppAssets.homeIndicator),),

            ]
            ),
          ),
        ),
      ),
    );
  }
}
