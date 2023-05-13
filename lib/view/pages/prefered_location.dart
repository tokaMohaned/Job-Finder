
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utilites/AppAssets.dart';
import '../customeWidget/main_button.dart';
import 'Done_pages/register_don_page.dart';

class Prefered_location extends StatefulWidget {
  static const String routName="Prefered_location";

  const Prefered_location({Key? key}) : super(key: key);

  @override
  State<Prefered_location> createState() => _Prefered_locationState();
}

class _Prefered_locationState extends State<Prefered_location> {
  @override
  Widget build(BuildContext context) {
    bool isremote=false;
    int selct=0;
    bool isPressed=false;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text("Where are you prefefred Location?",style: TextStyle(
              fontSize: 24.sp,
            ),),

            Text("Let us know, where is the work location you want "
                "at this time, so we can adjust it.",style: TextStyle(
              fontSize: 14.sp,
              color: Color(0xfF737379),
            ),),
            SizedBox(height: 2.h,),

            Container(
             // alignment: Alignment.center,
              //width: 3.w,
              height: 4.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
               // color: Color(0xfFF4F4F5)
                color: Colors.red

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center
                ,
                //mainAxisSize: MainAxisSize.min,

                children: [
                  Flex(direction: Axis.horizontal,
                    children:[ Container(
                      width:MediaQuery.of(context).size.width*.05,
                      color: isremote?Colors.blue:Colors.grey,
                    child: InkWell(
                        onTap: (){
                          isremote=true;
                          setState(() {

                          });
                             // if(remote==false)
                             //   {
                             //
                             //   }
                        },
                        child: Text("Work From Office")),
                    ),]
                  ),

                  Flex(
                    direction: Axis.horizontal,
                    children: [Container(//
                      //width: MediaQuery.of(context).size.,
                      color: isremote?Colors.grey:Colors.blue,

                      child: InkWell(
                          onTap: (){
                            isremote=false;
                            setState(() {

                            });

                          },
                          child: Text("Remote Work")),
                    ),]
                  )

                  //   InkWell(
                  //
                  //      child:
                  //
                  //      Chip(
                  //       label: Text("Work From Office",style: TextStyle(
                  //         fontSize: 14.sp,
                  //         color: isPressed? Color(0xfFFFFFF): Color(0xfF6B7280),
                  //       ),),
                  //       backgroundColor:isPressed? Color(0xfF4F4F5):Color(0xfF091A7A) ,
                  //     ),
                  //   ),
                  // Chip(
                  //   label: Text("Remote Work",style: TextStyle(
                  //     fontSize: 14.sp,
                  //
                  //   ),),
                  //   backgroundColor:Color(0xfFF4F4F5) ,
                  // ),
                ],
              ),
            ),
            SizedBox(height: 2.h,),
            Text("Select the country you want for your job",style:
              TextStyle(
                fontSize: 14.sp,
                color: Color(0xff737379),
              ),),
            SizedBox(height: 1.h,),
            // Container(
            //   child: showCountryPicker
            //     (context: context,
            //       countryListTheme: CountryListThemeData,
            //       onSelect: onSelect)
            //
            //
            //   ShowCountryPicker(
            //     context: context,
            //     countryListTheme: CountryListThemeData(
            //       flagSize: 25,
            //       backgroundColor: Colors.white,
            //       textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
            //       bottomSheetHeight: 500, // Optional. Country list modal height
            //       //Optional. Sets the border radius for the bottomsheet.
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(20.0),
            //         topRight: Radius.circular(20.0),
            //       ),
            //       //Optional. Styles the search field.
            //       inputDecoration: InputDecoration(
            //         labelText: 'Search',
            //         hintText: 'Start typing to search',
            //         prefixIcon: const Icon(Icons.search),
            //         border: OutlineInputBorder(
            //           borderSide: BorderSide(
            //             color: const Color(0xFF8C98A8).withOpacity(0.2),
            //           ),
            //         ),
            //       ),
            //     ),
            //     onSelect: (Country country) => print('Select country: ${country.displayName}'),
            //   ),
           // )
            Expanded(child:
            Container(
              width:MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height*.5,

              padding: EdgeInsets.all(12.0),
              child: GridView.builder(
                shrinkWrap: true,

                  //physics: const NeverScrollableScrollPhysics(),
                  itemCount: Location.locationList.length,
                  gridDelegate:
                   SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                     childAspectRatio: (1 / .4),
                     //crossAxisSpacing: 4.h,
                     mainAxisSpacing: .010.w,


                   ),

                  itemBuilder: (context,index)
                  {
                    return Column(
                      children: [
                        InkWell(
                          onTap: ()
                          {
                            setState(() {

                            Location.locationList[index].selected=!Location.locationList[index].selected;
                            if(Location.locationList[index].selected==true)
                            {
                              selct++;
                              print(selct);
                              isPressed=true;

                            }

                            //isPressed=!isPressed;
                           // print("done");


                            });

                          },
                          child:
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:BorderRadius.circular(100),
                              ///////////////////
                              color: Location.locationList[index].selected? const Color(0xFfD6E4FF):  Colors.white,
                              border: Border.all
                              (color: Location.locationList[index].selected? const Color(0xFf3366FF): const Color(0xFfD1D5DB)),

                              ),
                              child: Align(alignment: Alignment.topLeft,
                              child:
                                SelectCountry(Location.locationList[index]),

                                ),
                                ),

                              ),
                            ),
                          ),


                      ],
                    );
                  }
              ),
            ),
            ),
            SizedBox(height: .05.h,),
            MainButton(text: 'Next',
              onTap: () {
                setState(() {///الشرط محتاج يتظبطت
                  if(isPressed)
                  {
                    Navigator.pushNamed(context, Register_Done_page.routName);
                  }
                });

              },),
           // SizedBox(height: 2.h),


          ],
        ),



      ),
    );
  }
}


class Location{
  final String image;
  final String countryName;
  bool selected;

  Location({required this.image,
    required this.countryName,
    required this.selected});
  static List<Location>locationList = <Location>
  [
    Location(image:AppAssets.argntina,
      countryName: 'United States', selected: false,),

    Location(image:AppAssets.unitedasatate,
      countryName: 'Argentina', selected: false,),

    Location(image:AppAssets.canada,
      countryName: 'Canada', selected: false,),

    Location(image:AppAssets.china,
      countryName: 'China', selected: false,),


    Location(image:AppAssets.india,
      countryName: 'India', selected: false,),

    Location(image:AppAssets.indonesi,
      countryName: 'Indonesia', selected: false,),

    Location(image:AppAssets.malaysia,
      countryName: 'Malaysia', selected: false,),

    Location(image:AppAssets.philliphines,
      countryName: 'Philiphines', selected: false,),

    Location(image:AppAssets.polanda,
      countryName: 'Polandia', selected: false,),

    Location(image:AppAssets.prazil,
      countryName: 'Brazil', selected: false,),

    Location(image:AppAssets.saudiArabia,
      countryName: 'Saudi Arabia', selected: false,),

    Location(image:AppAssets.singapore,
      countryName: 'Singapore', selected: false,),


  ];
}

class SelectCountry extends StatelessWidget {
   // SelectCountry({Key? key}) : super(key: key);
Location? location;
   SelectCountry(this.location);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("${location?.image}",),
          radius:10,
        ),
       SizedBox(width: 2.w ,),
        Text("${location?.countryName}",style: TextStyle(
          fontSize: 14.sp,
        ),),
      ],
    );
  }
}
