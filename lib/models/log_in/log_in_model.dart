// ignore_for_file: constant_identifier_names, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gozap_package/components/apiservices.dart';
import 'package:gozap_package/models/user/user_model.dart';

import 'package:provider/provider.dart';

enum LogInModelStatus {
  Ended,
  Loading,
  Error,
}

class LogInModel extends ChangeNotifier {
  late LogInModelStatus _status;
  late String _errorCode;
  late String _errorMessage;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  LogInModelStatus get status => _status;

  LogInModel();

  LogInModel.instance(BuildContext context, Widget nextScreen) {
    // ignore: todo
    //TODO Add code here
    getter(context,nextScreen:nextScreen);
  }

  Future<void> getter(BuildContext context,{Widget? nextScreen}) async {
    _status = LogInModelStatus.Loading;
    notifyListeners();

    await Provider.of<userChangeNotifier>(context, listen: false).get(context);
    UserModule? user=  Provider.of<userChangeNotifier>(context, listen: false).user;
    if (user!=null) {
      Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>nextScreen!));
    }

    _status = LogInModelStatus.Ended;
    notifyListeners();
  }

  Future<void> setter(BuildContext context,
      {Map<String, dynamic>? data, required Widget nextScreen}) async {
    _status = LogInModelStatus.Loading;
    notifyListeners();
    try {
      var resdata = await APIService(context).postData(
          "User/login.php",
          {
            "phonenumber": data!["phonenumber"],
            "password": data["password"],
          },
          false);
      if (resdata != null) {
        UserModule userModule = UserModule.fromJson(resdata);
        await Provider.of<userChangeNotifier>(context, listen: false)
            .set(context, userModule, false, nextScreen);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    _status = LogInModelStatus.Ended;
    notifyListeners();
  }

  void update() {
    _status = LogInModelStatus.Loading;
    notifyListeners();

    // ignore: todo
    //TODO Add code here

    _status = LogInModelStatus.Ended;
    notifyListeners();
  }

  void remove() {
    _status = LogInModelStatus.Loading;
    notifyListeners();

    // ignore: todo
    //TODO Add code here

    _status = LogInModelStatus.Ended;
    notifyListeners();
  }
}
