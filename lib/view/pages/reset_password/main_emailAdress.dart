import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../customeWidget/defaulit_form_field.dart';
import '../../customeWidget/main_button.dart';


class MainEmailAdress extends StatelessWidget {
  static const String routName="MainEmailAdress";

  const MainEmailAdress({Key? key}) : super(key: key);

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
        title: Text("Email address"),
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
                "Main e-mail address",
                style: TextStyle(
                  fontSize: 26.sp,
                ),
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

            MainButton(
              text: 'Save',
              onTap: () {
                if(formKey.currentState!.validate())
                {
                  //Navigator.pushNamed(context, Phone_number.routName);
                  print(emailController);
                }
              },),

          ]),
        ),
      ),
    );
  }
}
