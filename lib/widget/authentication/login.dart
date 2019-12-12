import 'dart:convert';
import 'dart:io';

import 'package:app_demo/custom_fonts_icons.dart';
import 'package:app_demo/data_manager.dart';
import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/progressbar_helper.dart';
import 'package:app_demo/helper/shareprefrenceshelper.dart';
import 'package:app_demo/helper/utils.dart';
import 'package:app_demo/helper/widget_helper.dart';
import 'package:app_demo/model/request/login_request.dart';
import 'package:app_demo/model/responses/login_r.dart';
import 'package:app_demo/pageRouter/slide_page_router.dart';
import 'package:app_demo/validator/common_validator.dart';
import 'package:app_demo/widget/authentication/forgot_passsword.dart';
import 'package:app_demo/widget/authentication/signup.dart';
import 'package:app_demo/widget/dashboard/dashboard.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _mobileController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    savePreference();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                WidgetHelper.logoFields(),
                new Form(key: _formKey, child: _buildTextFields()),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _buildTextFields() {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Theme(
              data: new ThemeData(
                  hintColor: ColorsHelper.blue(),
                  primaryColor: ColorsHelper.blue()),
              child: new TextFormField(
                validator: CommonValidator.mobileNumValidationWithEmpty,
                style: TextStyle(color: ColorsHelper.blue()),
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: new InputDecoration(
                    counterText: '',
                    prefixIcon: Icon(
                      CustomFonts.mobile,
                      color: ColorsHelper.orange(),
                      size: 20,
                    ),
                    labelText: 'Mobile',
                    labelStyle: TextStyle(fontSize: 15),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsHelper.blue())),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsHelper.blue()))),
              ),
            ),
          ),
          new Container(
              child: new Theme(
            data: new ThemeData(
                hintColor: ColorsHelper.blue(),
                primaryColor: ColorsHelper.blue()),
            child: new TextFormField(
              validator: CommonValidator.passValidation,
              style: TextStyle(color: ColorsHelper.blue()),
              obscureText: true,
              controller: _passwordController,
              decoration: new InputDecoration(
                  prefixIcon: Icon(
                    CustomFonts.phonelink_lock,
                    color: ColorsHelper.orange(),
                    size: 20,
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 15),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorsHelper.blue())),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorsHelper.blue()))),
            ),
          )),
          new Container(
            child: new Column(
              children: <Widget>[
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new FlatButton(
                      onPressed: _passwordReset,
                      child: new Text('Forgot Password?'),
                      textColor: ColorsHelper.blueLight(),
                    )
                  ],
                ),
                new ButtonTheme(
                    minWidth: 200,
                    child: new RaisedButton(
                      textColor: ColorsHelper.white(),
                      color: ColorsHelper.orange(),
                      child: new Text('Login'),
                      onPressed: _loginPressed,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    )),
                new ButtonTheme(
                    minWidth: 200,
                    child: new RaisedButton(
                      textColor: ColorsHelper.white(),
                      color: ColorsHelper.orange(),
                      child: new Text('Sign Up'),
                      onPressed: _signUpPressed,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _loginPressed() {
    if (_formKey.currentState.validate()) {
      _onLoginApiCall();
    }
  }

  void _signUpPressed() {
    Navigator.of(context)
        .push(new SlideLeftRoute(widget: new SignUp(_mobileController.text)));
  }

  void onAlertButtonClick() {
    Navigator.pop(context); //for dismiss alert dialog
  }

  void _passwordReset() {
    Navigator.of(context)
        .push(new SlideLeftRoute(widget: new ForgotPassword()));
  }

  _onLoginApiCall() async {
    ProgressBar.progressBarShow(context);
    http.Response response = await DataManager.of(context).api.login(
        context,
        'login',
        LoginRequest(
                _mobileController.text.trim(), _passwordController.text.trim())
            .toJson());
    LoginR data = DataManager.of(context).apiHelper.login(response);

    //hide loader
    Navigator.pop(context);
    if (data.s) {
      String accessToken = response.headers['access-token'];
      if (accessToken != null && accessToken.isNotEmpty) {
        SharePreferencesHelper.getInstant()
            .setString(SharePreferencesHelper.ACCESS_TOKEN, accessToken);
        SharePreferencesHelper.getInstant()
            .setString(SharePreferencesHelper.USER_DATA, jsonEncode(data.d));

        Navigator.of(context)
            .pushReplacement(new SlideRightRoute(widget: new DashBoard()));
      }
    } else {
      Utils.showAlertDialog(context: context, message: data.e);
    }
  }

  void savePreference() async {
    //set device info in header
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      SharePreferencesHelper.getInstant().setString(
          SharePreferencesHelper.OS_VERSION, ' ${androidInfo.version.release}');
      SharePreferencesHelper.getInstant().setString(
          SharePreferencesHelper.DEVICE_TYPE,
          ' ${androidInfo.brand}-${androidInfo.model}');
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      SharePreferencesHelper.getInstant().setString(
          SharePreferencesHelper.OS_VERSION, iosInfo.utsname.release);
      SharePreferencesHelper.getInstant().setString(
          SharePreferencesHelper.DEVICE_TYPE,
          ' ${iosInfo.utsname.machine}-${iosInfo.utsname.sysname}');
    }
  }
}
