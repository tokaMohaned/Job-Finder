import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/////////testing for tab in prefered location

class test extends StatefulWidget {
  static const String routName="test";

   test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // set the width of the parent container
      height: 100, // set the height of the parent container
      color: Colors.grey, // set the background color of the parent container
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              // handle onTap for the first child container
            },
            child: Container(
              width: 90, // set the width of the first child container
              height: 100, // set the height of the first child container
              color: Colors
                  .blue, // set the background color of the first child container
            ),
          ),
          InkWell(
            onTap: () {
              // handle onTap for the second child container
            },
            child: Container(
              width: 90, // set the width of the second child container
              height: 100, // set the height of the second child container
              color: Colors
                  .green, // set the background color of the second child container
            ),
          ),
        ],
      ),
    );
  }}
