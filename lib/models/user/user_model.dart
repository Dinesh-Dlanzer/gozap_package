// ignore_for_file: non_constant_identifier_names, camel_case_types, use_build_context_synchronously

import 'dart:convert';
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:gozap_package/models/DB/table.dart';
import 'package:gozap_package/components/DB/db.dart';
import 'package:gozap_package/components/common.dart';
import 'package:gozap_package/views/log_in/log_in_view.dart';
import 'package:gozap_package/components/themes/themes.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class UserModule {
  late int UserID;
  late String UserName;
  late String PhoneNumber;
  late bool IsAdmin;
  late String UserReferID;
  late DateTime UserCreatedAt;
  late DateTime UserUpdatedAt;
  UserModule(
      {required this.UserID,
      required this.UserName,
      required this.PhoneNumber,
      required this.UserReferID,
      required this.IsAdmin,
      required this.UserCreatedAt,
      required this.UserUpdatedAt});

  static Map<String, dynamic> toMap(UserModule user) {
    var map = <String, dynamic>{};
    map['UserID'] = user.UserID;
    map['UserName'] = user.UserName;
    map['PhoneNumber'] = user.PhoneNumber;
    map['UserReferID'] = user.UserReferID;
    map['IsAdmin'] = user.IsAdmin?1:0;
    map['UserCreatedAt'] = user.UserCreatedAt.toString();
    map['UserUpdatedAt'] = user.UserUpdatedAt.toString();
    return map;
  }

  factory UserModule.fromJson(dynamic json) {
    return UserModule(
      UserID: json['UserID'],
      UserName: json['UserName'],
      PhoneNumber: json['PhoneNumber'],
      UserReferID:json['UserReferID']??"",
      IsAdmin: json['IsAdmin']==1?true:false,
      UserCreatedAt: DateTime.parse(json['UserCreatedAt']),
      UserUpdatedAt: DateTime.parse(json['UserUpdatedAt']),
    );
  }
  static String encode(UserModule save) => json.encode(UserModule.toMap(save));

  static UserModule? decode(String saves) {
    if (saves.isNotEmpty && saves != '') {
      return UserModule.fromJson(json.decode(saves));
    }
    return null;
  }
}

class userChangeNotifier extends ChangeNotifier {
  UserModule? _user;

  UserModule? get user => _user;
  Future<void> set(BuildContext context, UserModule user, bool isSignup,
      Widget nextScreen) async {
    try {
      bool isSaved = await Provider.of<LocalDB>(context, listen: false)
          .writeData(DBTable.User, UserModule.encode(user));
      if (isSaved) {
        _user = user;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AnimatedSplashScreen(
                      duration: 3500,
                      splashIconSize: 300.0,
                      // splash: "images/logos/gofuel_logo.jpeg",
                      splash: isSignup
                          ? Container(
                              child: Common.lottieSignedupWidget(context),
                            )
                          : Container(
                              child: Common.lottieLoggedInWidget(context),
                            ),
                      nextScreen: nextScreen,
                      backgroundColor: AppTheme.whiteColor,
                      splashTransition: SplashTransition.fadeTransition,
                    )));
      } else {
        _user = null;
        Toast.show("Somthing went wrong",
            duration: Toast.lengthLong, gravity: Toast.bottom);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    notifyListeners();
  }

  Future<void> get(BuildContext context) async {
    _user = UserModule.decode(await Provider.of<LocalDB>(context, listen: false)
        .readData(DBTable.User));
    notifyListeners();
  }

  Future<void> remove(BuildContext context, Widget nextScreen) async {
    bool isRemoved = await Provider.of<LocalDB>(context, listen: false)
        .removeData(DBTable.User);
    if (isRemoved) {
      _user = null;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LogInView(nextScreen: nextScreen)));
    }
    notifyListeners();
  }
}
