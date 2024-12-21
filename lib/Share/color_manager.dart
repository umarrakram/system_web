import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(0xffED9728);
  static Color darkGrey = const Color(0xff525252);
  static Color grey = const Color(0xff737477);
  static Color lightGrey = const Color(0xff9E9E9E);

  // new colors
  static Color darkPrimary = const Color(0xffd17d11);
  static Color lightPrimary = const Color(0xCCd17d11); // color with 80% opacity
  static Color grey1 = const Color(0xff707070);
  static Color grey2 = const Color(0xff797979);
  static Color white = const Color(0xffFFFFFF);
  static Color error = const Color(0xffe61f34); // red color
}   // ColorManager.white,

const String imagePath = "assets/images";

class ImageAssets {
  static const String splashLogo = "$imagePath/splash_logo.png";
  static const String onboardingLogo1 = "assets/splash_img/splash1.jpg";
  static const String onboardingLogo2 = "assets/splash_img/splash2.jpg";
  static const String onboardingLogo3 = "assets/splash_img/splash3.jpg";
  static const String onboardingLogo4 = "$imagePath/onboarding_logo4.svg";
  static const String hollowCircleIc = "$imagePath/hollow_cirlce_ic.svg";
  static const String solidCircleIc = "$imagePath/solid_circle_ic.svg";
  static const String leftArrowIc = "$imagePath/left_arrow_ic.svg";
  static const String rightArrowIc = "$imagePath/right_arrow_ic.svg";
}