import 'package:flutter/material.dart';

class Constants {
  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double deviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
}

// Image.asset(
//           'assets/icon/yakkaw.png',
//         ), as a constant
final Image kPoppyFlowLogo = Image.asset(
  'assets/images/pwpt.png',
);
final Image kPwPLogo = Image.asset(
  'assets/images/pwplogot.png',
);

const String kPoppyFlowLogoAssetPath = 'assets/images/PoppyFlowT.png';

final Image kPassWordLogo = Image.asset(
  'assets/images/forgotpass.png',
);

//sized box constants
const SizedBox kSizedBoxH10 = SizedBox(height: 10);
const SizedBox kSizedBoxH16 = SizedBox(height: 16);
const SizedBox kSizedBoxH20 = SizedBox(height: 20);
const SizedBox kSizedBoxH30 = SizedBox(height: 30);
const SizedBox kSizedBoxH40 = SizedBox(height: 40);
const SizedBox kSizedBoxH50 = SizedBox(height: 50);
const SizedBox kSizedBoxH60 = SizedBox(height: 60);
const SizedBox kSizedBoxH70 = SizedBox(height: 70);
const SizedBox kSizedBoxH80 = SizedBox(height: 80);
const SizedBox kSizedBoxH90 = SizedBox(height: 90);
const SizedBox kSizedBoxH100 = SizedBox(height: 100);

//color constants
const Color pflowMistyGrey = Color(0xFF7FE0EB);
const Color pflowBlue = Color(0xff4DD8E0);
const Color pflowBlueGrey = Color(0xff263137);
const Color yakkaWhite = Color(0xffffffff);
const Color yakkaBlack = Color(0xff000000);
const Color yakkaGreen = Color(0xff08C04A);
const Color facebookColor = Color(0xff39579A);
const Color twitterColor = Color(0xff00ABEA);
const Color instaColor = Color(0xffBE2289);
const Color whatsappColor = Color(0xff075E54);
const Color linkedinColor = Color(0xff0085E0);
const Color githubColor = Color(0xff202020);
const Color googleColor = Color(0xffffffff);

const TextStyle kAppBarTextStyle = TextStyle(
  color: yakkaBlack,
  fontSize: 20,
);
