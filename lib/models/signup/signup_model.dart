// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:gozap_package/components/apiservices.dart';
import 'package:gozap_package/models/user/user_model.dart';

enum SignupModelStatus {
  Ended,
  Loading,
  Error,
}

class SignupModel extends ChangeNotifier {
  late SignupModelStatus _status;
  late String _errorCode;
  late String _errorMessage;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  SignupModelStatus get status => _status;

  SignupModel();

  SignupModel.instance() {
    // ignore: todo
    //TODO Add code here
    getter();
  }

  void getter() {
    _status = SignupModelStatus.Loading;
    notifyListeners();

    // ignore: todo
    //TODO Add code here

    _status = SignupModelStatus.Ended;
    notifyListeners();
  }

  Future<void> setter(BuildContext context,
      {Map<String, dynamic>? data, required Widget nextScreen}) async {
    _status = SignupModelStatus.Loading;
    notifyListeners();
    try {
      var resdata = await APIService(context).postData(
          "User/signup.php",
          {
            "name": data!["name"],
            "phonenumber": data["phonenumber"],
            "password": data["password"],
            "DEID": data["DEID"],
            "UserReferID": data["UserReferID"]??"",
            
          },
          false);
      if (resdata != null) {
        UserModule userModule = UserModule.fromJson(resdata);
        // ignore: use_build_context_synchronously
        await Provider.of<userChangeNotifier>(context, listen: false)
            .set(context, userModule, true, nextScreen);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    _status = SignupModelStatus.Ended;
    notifyListeners();
  }

  void update() {
    _status = SignupModelStatus.Loading;
    notifyListeners();

    // ignore: todo
    //TODO Add code here

    _status = SignupModelStatus.Ended;
    notifyListeners();
  }

  void remove() {
    _status = SignupModelStatus.Loading;
    notifyListeners();

    // ignore: todo
    //TODO Add code here

    _status = SignupModelStatus.Ended;
    notifyListeners();
  }
}
