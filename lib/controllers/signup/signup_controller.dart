import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:gozap_package/models/signup/signup_model.dart';

class SignupController {
  SignupController();

  void getter(BuildContext context) {
    SignupModel viewModel = Provider.of<SignupModel>(context, listen: false);
    // ignore: todo
    //TODO Add code here for getter
    viewModel.getter();
  }

  void setter(BuildContext context, Widget nextScreen) {
    SignupModel viewModel = Provider.of<SignupModel>(context, listen: false);
    // ignore: todo
    //TODO Add code here for setter
    viewModel.setter(context, nextScreen: nextScreen);
  }

  void update(BuildContext context) {
    SignupModel viewModel = Provider.of<SignupModel>(context, listen: false);
    // ignore: todo
    //TODO Add code here for update
    viewModel.update();
  }

  void remove(BuildContext context) {
    SignupModel viewModel = Provider.of<SignupModel>(context, listen: false);
    // ignore: todo
    //TODO Add code here for remove
    viewModel.remove();
  }
}
