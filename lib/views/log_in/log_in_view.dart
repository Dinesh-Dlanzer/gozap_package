// ignore_for_file: unused_local_variable, must_be_immutable

// import packages
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:gozap_package/components/common.dart';
import 'package:gozap_package/components/responsive.dart';
import 'package:gozap_package/components/themes/themes.dart';
import 'package:gozap_package/views/signup/signup_view.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_field_validator/form_field_validator.dart';
// import models
import 'package:gozap_package/models/log_in/log_in_model.dart';
// import controllers
import 'package:gozap_package/controllers/log_in/log_in_controller.dart';
// import translation
import 'package:gozap_package/components/localization/app_translations.dart';

class LogInView extends StatefulWidget {
  LogInView({
    super.key,
    required this.nextScreen,
  });
  Widget nextScreen;
  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final _globalLogin = GlobalKey<FormBuilderState>();

  bool _obscureTextLogin = true;

  @override
  Widget build(BuildContext context) {
    LogInController viewController = LogInController();
    return ChangeNotifierProvider<LogInModel>(
      create: (context) => LogInModel.instance(context,widget.nextScreen),
      child: Consumer<LogInModel>(
        builder: (context, viewModel, child) {
          if (viewModel.status == LogInModelStatus.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var loginFormWidget = Container(
              constraints: const BoxConstraints(maxWidth: 400),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  //login form
                  FormBuilder(
                    key: _globalLogin,
                    onChanged: () {
                      _globalLogin.currentState!.save();
                    },
                    child: Column(
                      children: <Widget>[
                        //rider ID / Phone Number
                        FormBuilderTextField(
                          name: "phonenumber",
                          inputFormatters: const [],
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: AppTranslations.of(context)!
                                    .text("key_field_requird")),
                          ]),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 0.0),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(
                              CupertinoIcons.person,
                              color: Colors.black,
                              size: 15.0,
                            ),
                            hintText: AppTranslations.of(context)!
                                .text("key_login_field_RiderID_or_PhoneNumber"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //Password
                        FormBuilderTextField(
                          name: "password",
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: AppTranslations.of(context)!
                                    .text("key_field_requird")),
                          ]),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          obscureText: _obscureTextLogin,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 0.0),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(
                              CupertinoIcons.lock_fill,
                              color: Colors.black,
                              size: 15.0,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureTextLogin = !_obscureTextLogin;
                                });
                              },
                              child: Icon(
                                _obscureTextLogin
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash_fill,
                                color: Colors.black,
                                size: 22.0,
                              ),
                            ),
                            hintText: AppTranslations.of(context)!
                                .text("key_login_field_Password"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //Login Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_globalLogin.currentState
                                            ?.value["phonenumber"] !=
                                        null &&
                                    _globalLogin
                                            .currentState?.value["password"] !=
                                        null) {
                                  viewModel.setter(context,
                                      data: _globalLogin.currentState?.value,
                                      nextScreen: widget.nextScreen);
                                } else {
                                  Toast.show(
                                      AppTranslations.of(context)!
                                          .text("key_field_requird"),
                                      duration: Toast.lengthLong,
                                      gravity: Toast.bottom);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  AppTranslations.of(context)!
                                      .text("key_btn_login"),
                                  style: const TextStyle(fontSize: 16),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  //Forgor Password & Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Forgor Password
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppTranslations.of(context)!
                              .text("key_btn_forgot_password"),
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      //Sign Up
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupView(
                                      nextScreen: widget.nextScreen)));
                        },
                        child: Text(
                          AppTranslations.of(context)!.text("key_btn_sign_up"),
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
            return Scaffold(
              body: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ResponsiveWidget(
                      mobileBody: Column(
                        children: [
                          //GoZAP Small Banner
                          Common.brandSmallBannerWidget(context),
                          //GoZAP Logo
                          Common.brandSmallColorLogoWidget(context),
                          //GoZAP Welcome Text
                          Common.welcomeTextWidget(context),
                          //GoZAP login Form
                          loginFormWidget,
                        ],
                      ),
                      desktopBody: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .65,
                            height: MediaQuery.of(context).size.height,
                            color: AppTheme.secondaryColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //GoZAP Large Banner
                                Common.brandLargeBannerWidget(context),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                //GoZAP Small Color Logo
                                Common.brandSmallColorLogoWidget(context),
                                //GoZAP Welcome Text
                                Common.welcomeTextWidget(context),
                                //GoZAP Welcome login Phara
                                Common.loginPharaWidget(context),
                                //GoZAP login Form
                                loginFormWidget,
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
