import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  late String image;
  late String hintText;
  late bool obsecuretext;
  IconButton? suffixIcon;
  FormFieldValidator? validator;
  ValueChanged<String>? onChanged;
  TextEditingController? controller = TextEditingController();

  CustomTextFormField(
      {required this.image,
      required this.hintText,
      this.obsecuretext = false,
      this.suffixIcon,
      this.validator,
      this.onChanged,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obsecuretext,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: ImageIcon(
            AssetImage(image),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD1D5DB)),
              borderRadius: BorderRadius.circular(10)),
          prefixIconColor: Colors.black,
          focusColor: Colors.blue,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFF9CA3AF),
          )),
      style: TextStyle(fontSize: 14.sp),
    );
  }
}
