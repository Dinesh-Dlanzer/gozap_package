// ignore_for_file: unnecessary_question_mark, non_constant_identifier_names, unused_local_variable, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'dart:io';
import 'dart:convert';
import 'package:gozap_package/models/common.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class APIService {
  BuildContext context;
  APIService(this.context);
  Future<bool> GetConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    bool isInternetOn = false;
    if (connectivityResult == ConnectivityResult.none) {
      isInternetOn = false;
    } else if (connectivityResult == ConnectivityResult.mobile) {
      isInternetOn = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isInternetOn = true;
    }
    return isInternetOn;
  }

  Future<String?> getData(dynamic? url, bool? token,
      {bool loader = true}) async {
    try {
      Future<bool> internetActive = GetConnect();

      if (await internetActive) {
        String mainURL= Provider.of<commonChangeNotifier>(context, listen: false).mainURL;
        var durl = mainURL+url!;
        var header = <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        };
        final response = await http.get(Uri.parse(durl), 
//                                         headers: header
                                       );
        if (response.statusCode == 200 || response.statusCode == 201) {
          dynamic res = json.decode(response.body);
          if (res["Message"] != null) {
            if (res["Message"].toString().isNotEmpty) {
              Toast.show(res["Message"],
                  duration: Toast.lengthLong, gravity: Toast.bottom);
            }
          }
          return response.body;
        } else {
          dynamic res = json.decode(response.body);
          if (res["Error"] != null) {
            Toast.show(res["Error"],
                duration: Toast.lengthLong, gravity: Toast.bottom);
          }
        }
      }
    } on SocketException catch (_) {
      Toast.show("Please check your internet",
          duration: Toast.lengthLong, gravity: Toast.bottom);
    }
    return null;
  }

  Future<dynamic?> postData(
      String? url, Map<String, dynamic> data, bool? token,
      {bool loader = true}) async {
    try {
      bool internetActive = await GetConnect();
      if (internetActive) {
        String mainURL= Provider.of<commonChangeNotifier>(context, listen: false).mainURL;
        var durl = mainURL+url!;
        var header = <String, String>{
          'content-type': 'application/json',
        };
        var body = data;
        final response = await http.post(Uri.parse(durl),
            // headers: header,
            body: body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          dynamic res = json.decode(response.body);
          if (res["Message"] != null) {
            if (res["Message"].toString().isNotEmpty) {
              Toast.show(res["Message"],
                  duration: Toast.lengthLong, gravity: Toast.bottom);
            }
          }
          return res;
        } else {
          dynamic res = json.decode(response.body);
          if (res["Message"] != null) {
            Toast.show(res["Message"],
                duration: Toast.lengthLong, gravity: Toast.bottom);
          }
        }
      }
    } on SocketException catch (_) {
      Toast.show("Please check your internet",
          duration: Toast.lengthLong, gravity: Toast.bottom);
    }
  }
}
