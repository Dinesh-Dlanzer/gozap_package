import 'package:flutter/material.dart';

class commonChangeNotifier extends ChangeNotifier {
  String _mainURL="";

  String get mainURL => _mainURL;
  
  set(BuildContext context,String url) async {
    _mainURL = url;
    notifyListeners();
  }
  get(BuildContext context) async {
    notifyListeners();
  }
  remove(BuildContext context) async {
    notifyListeners();
  }
}