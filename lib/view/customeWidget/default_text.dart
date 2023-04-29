
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget
{
  final String text;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color color;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextDecoration? textDecoration;


//constructor
  DefaultText(

      {
        Key? key,
        required this.text,
        this.maxLines,
        this.overflow=TextOverflow.ellipsis,//decreasing the amount of text displayed. If there is not enough space
        this.color=Colors.black,
        this.textAlign,
        this.textScaleFactor,
        this.fontWeight=FontWeight.normal,
        this.textDecoration,
        this.fontSize,
      }):super(key: key);

  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: textDecoration,
      ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
    );
  }
}