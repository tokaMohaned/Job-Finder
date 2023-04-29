import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controller/local/sharedPreference.dart';
import '../../utilites/AppAssets.dart';
import '../../utilites/enums.dart';
import '../customeWidget/defaulit_form_field.dart';
import '../customeWidget/main_button.dart';
import 'Login.dart';
import 'homeScreen.dart';

class RegitrationScreen extends StatelessWidget {
   RegitrationScreen({Key? key}) : super(key: key);
  static const String routName = "RegistrationScreen";
  var userNameController=TextEditingController
    (text:MyCache.getString(key: MyCacheKeys.name));
   var emailController=TextEditingController
     (text:MyCache.getString(key: MyCacheKeys.email));
   var passwordController=TextEditingController
     (text:MyCache.getString(key: MyCacheKeys.password));

var formKey=GlobalKey<FormState>();


   @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black,),
        actions: [
          Container(
            height: 19,
            width: 81,
            decoration:const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Logo.png",
                  ),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text("Create Account", style: TextStyle(
                    fontSize: 28,
                  ),),
                ),

                Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: const [
                      SizedBox(height: 8),

                      Text("Please create an account to find your dream job",style: TextStyle
                        (
                        fontSize:16 ,
                      ),),
                    ],
                  ),

                ),

                 const SizedBox(height:60 ),
                DefaultFormField(//user name
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter user name';
                    }
                    //return null;
                  },
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  labelText:"Username" ,
                  backgroundColor: Colors.white,
                  prefixIcon: const Icon(Icons.person_outline),
                    inputEnabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    //borderRadius: BorderRadius.circular(20),


                  ),
                  inputFocusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    //borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(height: 17,),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
                    labelText:"Email" ,
                    prefixIcon: const Icon(Icons.email_outlined),
                    inputEnabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      //borderRadius: BorderRadius.circular(20),

                    ),
                    inputFocusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                     // borderRadius: BorderRadius.circular(20),
                    ),

                  ),
                ),
                const SizedBox(height: 17,),
////////////////////////////////////////////////////////////////////////////////////////////////
                DefaultFormField(//password
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
                      return 'enter passowrd';
                    }
                    if(value!.length<8)
                      {
                        return
                        ("password must be at lease 8 characters");
                      }

                  },

                  controller: passwordController,
                  labelText:"Password" ,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon:const  ImageIcon(
                      AssetImage("assets/images/eye-slash.png"),

                  ),
                  inputEnabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),

                  ),
                  inputFocusedBorder: const OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.red),
                  ),

                ),

                const SizedBox(height:105 ,),
                Row(
                  children: [
                    const Text("Already have an account?",style:
                      TextStyle(
                        fontSize: 14,
                        color: Color(0xFf9CA3AF),
                      ),),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routName); },
                      child: const Text("Login",style:
                      TextStyle(
                      fontSize: 14,
                      color: Color(0xFf3366FF),
                    ),)),
                  ],
                ),
                const SizedBox(height: 37,),

                MainButton(
                  onTap: (){
                    if(formKey.currentState!.validate()) {
                      MyCache.putString(key: MyCacheKeys.email,
                          value: emailController.text);
                      MyCache.putString(key: MyCacheKeys.password,
                          value: passwordController.text);
                    }
                        Navigator.pushNamed(context, HomeScreen.routName);
                    print(emailController);
                    },
                     text: 'Create account', ),

                const SizedBox(height: 33,),

                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 36,
                          //width:64.5
                        )),
                  ),
                  const Text("Or Sign up With Account"),
                  Expanded(
                    child:  Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                ]),
                Row(
                    children: [
                 InkWell(
                   child: Image(
                image: AssetImage("assets/images/Button.png"),)
                 ),

                    Container( width: 154,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: ImageIcon(
                          AssetImage("assets/images/Button.png"),

                        ) ),
                    ),
                    const Spacer(),

                    ElevatedButton(
                        onPressed: (){},
                        child:const ImageIcon(
                          AssetImage("assets/images/facebook icon.png"),),),
                    ]
                ),




            Image(image: AssetImage(AppAssets.homeIndicator),),
              ],//chelderen of column
            ),
          ),
        ),
      ),

    );
  }
}
