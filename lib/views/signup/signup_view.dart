// ignore_for_file: unused_local_variable, must_be_immutable
// import packages
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_field_validator/form_field_validator.dart';
// import translation
import 'package:gozap_package/components/localization/app_translations.dart';
// import components
import 'package:gozap_package/components/common.dart';
import 'package:gozap_package/components/responsive.dart';
import 'package:gozap_package/components/themes/themes.dart';
// import model
import 'package:gozap_package/models/signup/signup_model.dart';
// import controller
import 'package:gozap_package/controllers/signup/signup_controller.dart';
// import View
import 'package:gozap_package/views/log_in/log_in_view.dart';

class SignupView extends StatefulWidget {
  SignupView({
    super.key,
    required this.nextScreen,
  });
  Widget nextScreen;

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _globalLogin = GlobalKey<FormBuilderState>();

  bool _obscureTextLogin = true;

  @override
  Widget build(BuildContext context) {
    SignupController viewController = SignupController();

    return ChangeNotifierProvider<SignupModel>(
      create: (context) => SignupModel.instance(),
      child: Consumer<SignupModel>(
        builder: (context, viewModel, child) {
          var signupFormWidget = Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                //signup Form
                FormBuilder(
                  key: _globalLogin,
                  onChanged: () {
                    _globalLogin.currentState!.save();
                  },
                  child: Column(
                    children: <Widget>[
                      //rider Name
                      FormBuilderTextField(
                        name: "name",
                        inputFormatters: const [],
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: AppTranslations.of(context)!
                                  .text("key_field_requird")),
                        ]),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 0.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(
                            CupertinoIcons.person,
                            color: Colors.black,
                            size: 15.0,
                          ),
                          hintText: AppTranslations.of(context)!
                              .text("key_login_field_RiderName"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),//DE ID
                      FormBuilderTextField(
                        name: "DEID",
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
                            borderSide:
                                const BorderSide(color: Colors.red, width: 0.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(
                            CupertinoIcons.person,
                            color: Colors.black,
                            size: 15.0,
                          ),
                          hintText: AppTranslations.of(context)!
                              .text("key_login_field_DEID"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //rider ID / Phone Number
                      FormBuilderTextField(
                        name: "phonenumber",
                        inputFormatters: const [],
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: AppTranslations.of(context)!
                                  .text("key_field_requird")),
                          MaxLengthValidator(10,
                              errorText: AppTranslations.of(context)!
                                  .text("key_field_phonenumber_requird")),
                          MinLengthValidator(10,
                              errorText: AppTranslations.of(context)!
                                  .text("key_field_phonenumber_requird")),
                        ]),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 0.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(
                            CupertinoIcons.person,
                            color: Colors.black,
                            size: 15.0,
                          ),
                          hintText: AppTranslations.of(context)!
                              .text("key_login_field_PhoneNumber"),
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
                            borderSide:
                                const BorderSide(color: Colors.red, width: 0.0),
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
                      FormBuilderTextField(
                        name: "confirmpassword",
                        validator: (val) => MatchValidator(
                                errorText: AppTranslations.of(context)!.text(
                                    "key_signup_field_Password_missmatech"))
                            .validateMatch(val!,
                                _globalLogin.currentState?.value["password"]),
                        // validator: MultiValidator([
                        //   RequiredValidator(
                        //       errorText: AppTranslations.of(context)!
                        //           .text("key_field_requird")),

                        // ]),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        obscureText: _obscureTextLogin,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 0.0),
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
                              .text("key_login_field_Confrim_Password"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FormBuilderTextField(
                        name: "referRiderid",
                        inputFormatters: const [],
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: AppTranslations.of(context)!
                                  .text("key_field_requird")),
                        ]),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 0.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(
                            CupertinoIcons.person,
                            color: Colors.black,
                            size: 15.0,
                          ),
                          hintText: AppTranslations.of(context)!
                              .text("key_login_field_ReferID"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //signup Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  // Change your radius here
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_globalLogin
                                      .currentState?.value["confirmpassword"] !=
                                  _globalLogin
                                      .currentState?.value["password"]) {
                                Toast.show(
                                    AppTranslations.of(context)!.text(
                                        "key_signup_field_Password_missmatech"),
                                    duration: Toast.lengthLong,
                                    gravity: Toast.bottom);
                              } else if (_globalLogin
                                          .currentState?.value["name"] !=
                                      null &&
                                  _globalLogin
                                          .currentState?.value["phonenumber"] !=
                                      null &&
                                  _globalLogin
                                          .currentState?.value["password"] !=
                                      null &&
                                  _globalLogin.currentState
                                          ?.value["confirmpassword"] !=
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
                                    .text("key_btn_sign_up"),
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
                                builder: (context) =>
                                    LogInView(nextScreen: widget.nextScreen)));
                      },
                      child: Text(
                        AppTranslations.of(context)!.text("key_btn_login"),
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
            body: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ResponsiveWidget(
                  mobileBody: Column(
                    children: [
                      //GoZAP Small Banner
                      Common.brandSmallBannerWidget(context),
                      //GoZAP Small Color Logo
                      Common.brandSmallColorLogoWidget(context),
                      //GoZAP Welcome Text
                      Common.welcomeTextWidget(context),
                      //GoZAP Welcome signup Phara
                      Common.signupPharaWidget(context),
                      //GoZAP signup Form
                      signupFormWidget,
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
                            //GoZAP Welcome signup Phara
                            Common.signupPharaWidget(context),
                            //GoZAP signup Form
                            signupFormWidget,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
