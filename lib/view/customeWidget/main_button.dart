import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'default_text.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  const MainButton({Key? key,required this.text, required this.onTap,  this.height,  this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
            child: DefaultText(
              text:text,
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

void navigateTo(context, widget)
{
  Navigator.push(context, MaterialPageRoute(builder: (context)=> widget));
}