import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:gozap_package/models/log_in/log_in_model.dart';

class LogInController {
  LogInController();

  void getter(BuildContext context) {
    LogInModel viewModel = Provider.of<LogInModel>(context, listen: false);
    // ignore: todo
    //TODO Add code here for getter
    viewModel.getter(context);
  }

  void setter(BuildContext context, Widget nextScreen) {
    LogInModel viewModel = Provider.of<LogInModel>(context, listen: false);
    // ignore: todo
    //TODO Add code here for setter
    viewModel.setter(context, nextScreen: nextScreen);
  }

  void update(BuildContext context) {
    LogInModel viewModel = Provider.of<LogInModel>(context, listen: false);
    // ignore: todo
    //TODO Add code here for update
    viewModel.update();
  }

  void remove(BuildContext context) {
    LogInModel viewModel = Provider.of<LogInModel>(context, listen: false);
    // ignore: todo
    //TODO Add code here for remove
    viewModel.remove();
  }
}
