import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationroject/view/customeWidget/main_button.dart';
import 'package:graduationroject/view/registration/prefered_location.dart';
import 'package:sizer/sizer.dart';
import '../../utilites/AppAssets.dart';

class Work_Type extends StatefulWidget {
   static const String routName="Work_Type";
  const Work_Type({Key? key}) : super(key: key);

  @override
  State<Work_Type> createState() => _Work_TypeState();
}

class _Work_TypeState extends State<Work_Type> {
  bool isPressed=false;

  @override
  Widget build(BuildContext context) {
   // Works works;

    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            SizedBox(height: 5.h,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("What type of work are you interested in?",
                style: TextStyle(
                  fontSize: 24,
                ),),
            ),

               SizedBox(height: 2.h,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("Tell us what you’re interested in "
                      "so we can customise the app for your needs.",
                    style: TextStyle
                    (
                    fontSize:16 ,
                  ),),
                ),
            SizedBox(height: .02.h,),
            Expanded(
              child: GridView.builder
                (
                shrinkWrap: true,
                  // crossAxisCount: Works.worksList.length,
                  // mainAxisSpacing: 0.25.w,
                  // crossAxisSpacing: .5.h,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                  itemCount: Works.worksList.length,
                  gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //mainAxisSpacing: .w,
               // crossAxisSpacing: .5.h,

               ),
               itemBuilder: (context, index)
                  {
                return Column( mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){

                        setState(() {
                          Works.worksList[index].selected =
                          !Works.worksList[index].selected;
                         // isPressed= Works.worksList[index].selected;
                          isPressed=!isPressed;
                          print("done");

                        });
                      },
                      child:
                      //SelectWork(Works.worksList[index]),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: SizedBox(
                          //height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          height:20.h,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            //width: 20.w,
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                                  borderRadius:BorderRadius.circular(12),
                              ///////////////////
                              color: Works.worksList[index].selected? const Color(0xFfD6E4FF): Colors.white,
                              border: Border.all
                                (color: Works.worksList[index].selected? const Color(0xFf3366FF): const Color(0xFfD1D5DB)),

                            ),
                            child: Align(alignment: Alignment.topLeft,
                              child:
                                SelectWork(Works.worksList[index]),

                            ),
                        ),
                        ),
                      ),
                    ),



                  ],
                );

              }//item builder

              ),
            ),
            SizedBox(height: .05.h,),
            MainButton(text: 'Next',
              onTap: () {
             setState(() {///الشرط محتاج يتظبطت
              if(isPressed)
               {
                 Navigator.pushNamed(context, Prefered_location.routName);
               }
             });

            },),
            SizedBox(height: 2.h),
            const Image(image: AssetImage(AppAssets.homeIndicator),),


          ],
        ),
      ),
    );
  }
}

class Works{
  final String image;
  final String text;
   bool selected;
  Works(this.image,{ required this.text,required this.selected});
  static List<Works>worksList= <Works>
  [
     Works(AppAssets.works1 ,text:"UI/UX",selected: false),
     Works(AppAssets.works2,text: "  Illustrator \n  Designer",selected: false),
     Works( AppAssets.works3, text: "  Developer",selected: false),
     Works(AppAssets.works4, text: "  Management",selected: false),
    Works(AppAssets.works5,
        text: "  Information\n  Technology",selected: false),
     Works(AppAssets.works6,
         text: "  Research \n  Analysis",selected: false),
  ];

}

class SelectWork extends StatelessWidget{
  Works? works;
  SelectWork(this.works, {super.key});
  @override
  Widget build(BuildContext context) {
   return Align(alignment: Alignment.topLeft,
     child: Column(mainAxisAlignment: MainAxisAlignment.center,
       children: [
         CircleAvatar(
             backgroundImage: AssetImage("${works?.image}",),


           //foregroundColor: Colors.purple,
            ),
         SizedBox(height: 2.h ,),
         Text("${works?.text}",style: TextStyle(
           fontSize: 16.sp,
         ),),
       ],
     ),
   );
  }
  
}

// Widget prepareList(int index)
// {
//   //return
// }