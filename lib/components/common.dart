// ignore_for_file: unused_local_variable

import 'themes/themes.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'localization/app_translations.dart';

class Common {
  static welcomeTextWidget(BuildContext context) => Text(
        AppTranslations.of(context)!.text("key_welcomemsg"),
        style: TextStyle(fontSize: 24, color: AppTheme.primaryColor),
      );
  static loginPharaWidget(BuildContext context) =>
      Text(AppTranslations.of(context)!.text("key_welcome_login_msg"));
  static signupPharaWidget(BuildContext context) =>
      Text(AppTranslations.of(context)!.text("key_welcome_signup_msg"));
  static goFuelLogoWidget(BuildContext context) => const Padding(
        padding: EdgeInsets.all(20),
        child: Image(
            image: AssetImage('assets/images/logos/gofuel_logo.jpeg',
                package: 'gozap_package')),
      );
  static brandSmallColorLogoWidget(BuildContext context) => const Padding(
        padding: EdgeInsets.all(20),
        child: Image(
            image: AssetImage('assets/images/logos/gozap_small_color_logo.png',
                package: 'gozap_package')),
      );
  static brandSmallBannerWidget(BuildContext context) => const Image(
      image: AssetImage('assets/images/bg/gozap_small_banner.png',
          package: 'gozap_package'));
  static brandLargeBannerWidget(BuildContext context) => const Image(
      image: AssetImage('assets/images/bg/gozap_large_banner.png',
          package: 'gozap_package'));
  static lottieSignedupWidget(BuildContext context) => Lottie.asset(
        "packages/gozap_package/assets/lottie/registered_lottie.json",
        repeat: false,
      );
  static lottieLoggedInWidget(BuildContext context) => Lottie.asset(
        "packages/gozap_package/assets/lottie/logged_in_lottie.json",
        repeat: false,
      );
}
