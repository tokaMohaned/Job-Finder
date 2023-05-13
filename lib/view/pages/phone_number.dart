
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
/////////testing for tab in prefered location

class Phone_number extends StatefulWidget {
  static const String routName="phone_number";
   Phone_number({Key? key}) : super(key: key);

  @override
  State<Phone_number> createState() => _Phone_numberState();
}

class _Phone_numberState extends State<Phone_number> {
  List<String> tabList=[
   "work form office",
    "remote work"
  ];
  Color containerColor=Colors.grey;

  bool onPressed=false;
  void changeColor() {
    setState(() {
      containerColor = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
      width: 327, // set the width of the parent container
      height: 46,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
           color: containerColor,
         ),// set the height of the parent container
     // color: Colors.grey, // set the background color of the parent container
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              changeColor();
              setState(() {

              });
              // handle onTap for the first child container
            },
            child: Container(
              width: 160, // set the width of the first child container
              height: 40, // set the height of the first child container
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: containerColor,
          ), // set the background color of the first child container
            ),
          ),
          GestureDetector(
            onTap: () {
              changeColor();
              containerColor;
              setState(() {

              });

              // handle onTap for the second child container
            },
            child: Container(
              width: 160, // set the width of the second child container
              height: 40, // set the height of the second child container
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: containerColor,
          ),// set the background color of the second child container
            ),
          ),
        ],
      ),
    )));
  }}



//         Container(width: 200,height: 100,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: containerColor,
//           ),
//           child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: GestureDetector(
//                   onTap: (){
//                     changeColor();
//                     //onPressed=!onPressed;
//                     setState(() {
//
//                     });
//                     print(onPressed);
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Center(
//                       child: Container(width:100 ,height: 50,
//                         decoration: BoxDecoration(
//                           color: onPressed?Colors.blue: Colors.grey
//                         ),
//                         child: (Text(" from office")),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: InkWell(
//                   onTap: (){
//                     onPressed=!onPressed;
//                     setState(() {
//
//                     });
//                     print(onPressed);
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Center(
//                       child: Container(width: 100,height: 50,
//                         decoration: BoxDecoration(
//                             color:
//                             onPressed?Colors.blue: Colors.grey
//                         ),
//                         child: (Text(" from office")),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
