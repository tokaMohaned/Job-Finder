import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationroject/utilites/AppAssets.dart';
import 'package:graduationroject/view/customeWidget/main_button.dart';
import 'package:sizer/sizer.dart';

class Done_page extends StatelessWidget {
  String? imagePath;
  String title1;
  String title2;
  String titleButton;
  final VoidCallback onTap;

  Done_page(
      {Key? key, required this.imagePath, required this.title1, required this.title2, required this.titleButton, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Spacer(),//flex,
            Image(image: AssetImage(imagePath!), fit: BoxFit.fill,),
            SizedBox(height: 5.h,),
            Text(title1,textAlign: TextAlign.center,),
            SizedBox(height: 2.h,),
            Text(title2),
            Spacer(),
            // MainButton(text: titleButton, onTap: () {
            //   onTap;
            // }),

              Center(
                child: SizedBox(
                  height: 5.h,
                  width: 80.w,
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFf3366FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1000),
                        )
                    ),

                    child: Center(
                      child:
                      Text (titleButton,style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),),


                    ),
                  ),
                ),
              ),

            //   SizedBox(height: 2.h),
            // Image(image: AssetImage(AppAssets.homeIndicator)),




            ],
      ),
          ),
        ),
    ),);
  }
}
