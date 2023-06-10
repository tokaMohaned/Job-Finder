import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationroject/controller/local/sharedPreference.dart';
import 'package:graduationroject/model/onBoarding_model.dart';
import 'package:graduationroject/utilites/AppAssets.dart';
import 'package:graduationroject/utilites/enums.dart';
import 'package:graduationroject/view/customeWidget/default_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utilites/appStirng.dart';
import '../registration_and_login/Login.dart';

class OnBoardScreen extends StatefulWidget {
  static const String routName = "OnBoard";

  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  PageController boardPageController = PageController();
  bool isLast = false;
  var currentIndex =  boardingList;
  String? titleButtton;


  finishOnBoarding(BuildContext context, String screenName) {
    MyCache.putBoolean(key: MyCacheKeys.IS_ON_BOARDING, value: true);
    Navigator.of(context).pushNamed(screenName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Expanded(
          //leadingWidth:100,
          child: Container(
            height: 19,
            width: 81,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Logo.png",
                  ),
                )),
          ),
        ),
        actions: [
          TextButton(
            child: DefaultText(
              text: AppString.skip,
              color: const Color(0xFf6B7280),
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>  LoginScreen()));

              finishOnBoarding(context, LoginScreen.routName);
            },
          ),
        ],
      ),
      //////////

      
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: PageView.builder(
              itemBuilder: (context, index) =>
                  buildBoardingItem(boardingList[index]),
              itemCount: boardingList.length,
              physics: const BouncingScrollPhysics(),
              controller: boardPageController,
              onPageChanged: (int index) {
                if (index == boardingList.length - 1) {
                  setState(() {
                    isLast = true;
                   titleButtton = "Get Started";

                  });}
                else {
                  isLast = false;
                  titleButtton = "Next";
                }

              },
            )),
            const SizedBox(height: 37,),
             Center(
              child: SmoothPageIndicator(
                controller: boardPageController,
                count: boardingList.length,
                effect: const ScrollingDotsEffect(
                  activeDotColor: Color(0xFf3366FF),
                  dotColor: Color(0xfFADC8FF),
                  dotHeight: 6,
                  dotWidth: 6,
                ),
              ),
            ),

            const SizedBox(height: 37,),

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 14),
              child: ElevatedButton(
                   child: Text(finishOnBoarding(context, LoginScreen.routName) ? "Get Stared" : "Next"),
                onPressed: (){
                   setState(() {});

                   // if (titleButtton=="Get Started")
                    if (finishOnBoarding(context, LoginScreen.routName))
                    {
                      isLast = true;
                      titleButtton = "Get Started";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  LoginScreen()));
                    }
                                else { {
                      isLast = false;
                      titleButtton = "Next";
                      }
                      } },
                  style:ElevatedButton.styleFrom(
                      fixedSize:const Size (327,48),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000)
                    )

                  ),

            ),

            ),



              const SizedBox(height: 43,),

            const Image(
              image: AssetImage(AppAssets.homeIndicator),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildBoardingItem(BoardingModel boardingListItem) {
  return Column(
    children: [
      Image(
        image:
        AssetImage(boardingListItem.image,),
        //fit: BoxFit.contain,

      ),
       SizedBox(height: 24,),
       Expanded(
         child: Container(// width: 327,height: 180,
          alignment: Alignment.center,
          child: Image (width: 327,height: 180,
            image: AssetImage(boardingListItem.image2),
            fit:BoxFit.contain,
          ),
      ),
       ),
      //Image(image: AssetImage(boardingListItem.image3),  ),
    ],
  );
}
