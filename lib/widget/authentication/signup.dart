
import 'package:app_demo/custom_fonts_icons.dart';
import 'package:app_demo/data_manager.dart';
import 'package:app_demo/enum/otp_validation_is_from.dart';
import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/string.dart';
import 'package:app_demo/helper/utils.dart';
import 'package:app_demo/helper/widget_helper.dart';
import 'package:app_demo/model/base_response.dart';
import 'package:app_demo/pageRouter/slide_page_router.dart';
import 'package:app_demo/validator/common_validator.dart';
import 'package:app_demo/widget/authentication/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState.mobileNum(mobileNum);
  final String mobileNum;

  SignUp(this.mobileNum);
}

class _SignUpState extends State<SignUp> {
  String mobileNum;

  _SignUpState.mobileNum(this.mobileNum);

  final _formKey = GlobalKey<FormState>();

  TextEditingController _mobileController = new TextEditingController();
  TextEditingController _empCodeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Theme(
          data: ThemeData(
              hintColor: ColorsHelper.blue(),
              primaryColor: ColorsHelper.blue()),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                WidgetHelper.logoFields(),
                new Form(key: _formKey, child: _buildTextFields()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    _mobileController.text = mobileNum;
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          TextFormField(
            validator: CommonValidator.mobileNumValidationWithEmpty,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _mobileController,
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  CustomFonts.mobile,
                  color: ColorsHelper.orange(),
                  size: 20,
                ),
                labelText: StringHelper.label_mobile_num_ast,
                labelStyle: TextStyle(fontSize: 15),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorsHelper.blue())),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorsHelper.blue()))),
          ),
          TextFormField(
            validator: CommonValidator.empValidation,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _empCodeController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(8),
              BlacklistingTextInputFormatter(new RegExp('[\\.|\\,]')),
            ],
            keyboardType: TextInputType.number,
            decoration: new InputDecoration(
                prefixIcon: Icon(
                  CustomFonts.phonelink_lock,
                  color: ColorsHelper.orange(),
                  size: 20,
                ),
                labelText: StringHelper.label_employee_code_ast,
                labelStyle: TextStyle(fontSize: 15),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorsHelper.blue())),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorsHelper.blue()))),
          ),
          new Container(
            margin: EdgeInsets.only(top: 20),
            child: new ButtonTheme(
                minWidth: 200,
                child: new RaisedButton(
                  textColor: ColorsHelper.white(),
                  color: ColorsHelper.orange(),
                  child: new Text(StringHelper.btn_send_otp),
                  onPressed: _sendOTPPressed,
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                )),
          )
        ],
      ),
    );
  }

  void _sendOTPPressed() {
    if (_formKey.currentState.validate()) {
      _generateOTPApi();
    }
  }

  void _generateOTPApi() async {
    BaseResponse data = await DataManager.of(context)
        .apiHelper
        .generateOTP(context, _mobileController.text, _empCodeController.text);
    if (data.s) {
      Navigator.of(context).push(new SlideLeftRoute(
          widget: new OTPVerification(_mobileController.text,
              _empCodeController.text, OTPValidationIsFrom.SIGN_UP.index)));
    } else {
      Utils.showAlertDialog(context: context, message: data.e);
    }
  }
}
