
import 'package:graduationroject/utilites/AppAssets.dart';

import '../utilites/appStirng.dart';

class BoardingModel
{
  late final String image;
  late final String image2;
  late final String image3;
  late final String buttonTitle;

  BoardingModel({required this.image,
    required this.image2, required this.image3,required this.buttonTitle});
  
}

final List<BoardingModel>boardingList=
    [
      BoardingModel(image: AppAssets.boarding1,
          image2: AppAssets.boarding1Title,
      image3: AppAssets.homeIndicator,
          buttonTitle:"next",
      ),

      BoardingModel(image: AppAssets.boarding2,
          image2: AppAssets.boarding2Title,
          image3: AppAssets.homeIndicator,
          buttonTitle:"next"),

      BoardingModel(image: AppAssets.boarding3,
          image2: AppAssets.boarding3Title,
          image3: AppAssets.homeIndicator,
          buttonTitle:"getStarted"),
    ];