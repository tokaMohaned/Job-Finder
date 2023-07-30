import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationroject/controller/logic/cubit/job_cubit.dart';
import 'package:graduationroject/view/pages/reset_password/forget_password.dart';
import 'package:sizer/sizer.dart';
import '../../controller/local/sharedPreference.dart';
import '../../controller/logic/cubit/job_state.dart';
import '../../utilites/AppAssets.dart';
import '../../utilites/enums.dart';
import '../customeWidget/customtTextFormField.dart';
import '../customeWidget/defaulit_form_field.dart';
import '../customeWidget/main_button.dart';
import 'register.dart';
import '../pages/home/BottomNavBar.dart';

class LoginScreen extends StatefulWidget {
  static const String routName = "loginScreen";

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obsecuretext = true;
  bool? checkBox = false;

  bool ispressed = false;

  var userNameController =
  TextEditingController(text: MyCache.getString(key: MyCacheKeys.name));

  var emailController =
  TextEditingController(text: MyCache.getString(key: MyCacheKeys.email));

  var passwordController =
  TextEditingController(text: MyCache.getString(key: MyCacheKeys.password));

  var formKey = GlobalKey<FormState>();

  void initState()
  {
    super.initState();
    checkConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    


    return BlocConsumer<JobCubit,JobsStates>(
      listener: ( context, state) {  },
      builder: ( BuildContext context, state) {
        var cubit = JobCubit.get(context);
        
        void login(String email, password) {
          if (formKey.currentState!.validate()) {
            cubit.login(email, password, context);
            var id = MyCache.getData(key: 'id')!;
            cubit.getSavedJobes(id);
            print(emailController);
          }
          // else showToast(context);
        }

        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: const BackButton(
              color: Colors.black,
            ),
            actions: [
              Container(
                height: 5.h,
                width: 20.w,
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
          backgroundColor: Colors.white,
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: Color(0xFF111827),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Please login to find your dream job',
                        style: TextStyle(fontSize: 12.sp, color: Color(
                            0xFF6B7280)),
                      ),
                    ],
                  ),


                  SizedBox(height: 5.h,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultFormField(
                      //user name
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter email';
                        }
                        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9]+.[a-z]").
                        hasMatch(value))
                        {
                          return "please enter valid email";
                        }
                        else {return null;}
                      },
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      //labelText: "Email",
                      hintText: "Email",
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
                  ),
                  SizedBox(height: 1.h,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultFormField(
                      //password
                      obscureText: ispressed,
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
                        if (value!.length < 8) {
                          return ("password must be at lease 8 characters");
                        }
                      },

                      controller: passwordController,
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon:
                      //ImageIcon(AssetImage("assets/images/eye-slash.png"),),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            ispressed = !ispressed;
                          });
                        },
                        icon: ispressed
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      inputEnabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      inputFocusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 6.w,
                        height: 15.w,
                        child: Checkbox(
                          value: checkBox,
                          onChanged: (data) {
                            setState(() {
                              checkBox = data;
                            });
                          },
                        ),
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(fontSize: 10.sp),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ForgetPassword.routName);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont’t have an account?',
                        style: TextStyle(fontSize: 11.sp, color: Color(
                            0xFF9CA3AF)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RegitrationScreen.routName);
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Color(0xFF3366FF), fontSize: 11.sp),
                          ))
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child:
                    MainButton(
                      onTap: () {
                        // if (formKey.currentState!.validate()) {
                        //   MyCache.putString(
                        //       key: MyCacheKeys.name,
                        //       value: userNameController.text);
                        //   MyCache.putString(
                        //       key: MyCacheKeys.password,
                        //       value: passwordController.text);
                        //   Navigator.pushNamed(context, HomeScreen.routName);
                        //
                        // }
                        login(emailController.text, passwordController.text);

                        print(emailController);
                      },
                      text: 'Login',
                    ),
                  ),


                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          color: const Color(0xFFD1D5DB),
                          width: 20.w,
                          height: 2,
                        ),
                        const Text(
                          'Or Login With Account',
                          style: TextStyle(
                              color: Color(0xFF6B7280), fontSize: 14),
                        ),
                        Container(
                          color: const Color(0xFFD1D5DB),
                          width: 20.w,
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(children: [
                    InkWell(
                      onTap: () {

                      },
                      child: Image(
                        image: AssetImage(AppAssets.googleIcon),
                      ),
                    ),
                    const Spacer(),

                    const InkWell(
                        child: Image(
                          image: AssetImage(AppAssets.facebookIcon),
                        )),


                  ]),
                  Spacer(),
                ],
              ),
            ),
          ),
        );

      } );
  }
 void showToast(context)
 {
   final scaffold= ScaffoldMessenger.of(context);
   scaffold.showSnackBar(SnackBar(
     content:Text('email or password is awrong',
       style: TextStyle(fontSize: 12.sp),) ,
     action: SnackBarAction(label: 'ok',
       onPressed: scaffold.hideCurrentSnackBar,),
   ));
 }

  checkConnectivity(BuildContext context) async
  {
    var result=await Connectivity().checkConnectivity();
    print('connection type => ${result.name}');
    if(result.name!= 'none')
      {

      }
    else{
      internetConnection(context);
    }
  }

 void internetConnection(context)
 {
   final scaffold= ScaffoldMessenger.of(context);
   scaffold.showSnackBar(SnackBar(
       content: Text('No internet connction',
         style:TextStyle(fontSize: 12.sp) , ),
     action: SnackBarAction(label: 'ok',onPressed: scaffold.hideCurrentSnackBar,),

   ));
 }
}//class

