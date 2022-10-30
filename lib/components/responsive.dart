// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    Key? key,
    required this.mobileBody,
    this.tabletBody,
    this.desktopBody,
  }) : super(key: key);

  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;
  
  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static double fullWidth(BuildContext context) =>
     MediaQuery.of(context).size.width;
  

  static double fullHeight(BuildContext context) =>
     MediaQuery.of(context).size.height;

  static const kTabletBreakpoint =
      768.0; //breakpoint for a tablet (a tablet's width is 768 px)
  static const kDesktopBreakPoint =
      1024.0; //breakpoint for desktop (a desktop screen's width is 1440 px)

  static const kSideMenuWidth = 300.0; // for sidemenu
  static const kNavigationRailWidth = 72.0; // for navigation rail

  static const kMaxWidth = 1180.0; // maximum width
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        // check if the device is a phone
        if (dimens.maxWidth >= kDesktopBreakPoint) {
          // returns mobileBody if desktopBody is null
          return desktopBody ?? mobileBody;
        } else if (dimens.maxWidth >= kTabletBreakpoint &&
            dimens.maxWidth < kDesktopBreakPoint) {
          // returns mobileBody if tabletBody is null
          return tabletBody ?? mobileBody;
        } else {
          return mobileBody;
        }
      },
    );
  }
}

class ScreenType extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ScreenType({
    required this.mobile,
    required this.desktop,
    Key? key,
    this.tablet,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double fullWidth(BuildContext context) =>
     MediaQuery.of(context).size.width;
  

  static double fullHeight(BuildContext context) =>
     MediaQuery.of(context).size.height;
  

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (_size.width >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (_size.width >= 650 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
