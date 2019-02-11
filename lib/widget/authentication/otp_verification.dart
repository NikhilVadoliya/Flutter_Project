import 'package:app_demo/app.dart';
import 'package:app_demo/enum/otp_validation_is_from.dart';
import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/progressbar_helper.dart';
import 'package:app_demo/helper/string.dart';
import 'package:app_demo/helper/utils.dart';
import 'package:app_demo/helper/widget_helper.dart';
import 'package:app_demo/model/base_response.dart';
import 'package:app_demo/model/responses/otp_response.dart';
import 'package:app_demo/pageRouter/slide_page_router.dart';
import 'package:app_demo/validator/common_validator.dart';
import 'package:app_demo/widget/authentication/signup_form.dart';
import 'package:flutter/material.dart';

class OTPVerification extends StatefulWidget {
  String mobileNum;
  String empCode;
  int isFrom;

  OTPVerification(this.mobileNum, this.empCode, this.isFrom);

  @override
  _OTPVerificationState createState() =>
      _OTPVerificationState(mobileNum, empCode, isFrom);
}

class _OTPVerificationState extends State<OTPVerification> {
  String mobileNum, empCode;
  int isFrom;

  _OTPVerificationState(this.mobileNum, this.empCode, this.isFrom);

  final _formKey = GlobalKey<FormState>();
  TextEditingController _otpController = new TextEditingController();

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
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  StringHelper.label_enter_otp,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ColorsHelper.blue()),
                ),
                Form(key: _formKey, child: _buildTextFields()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          TextFormField(
            validator: CommonValidator.otpValidation,
            style: TextStyle(color: ColorsHelper.blue()),
            controller: _otpController,
            maxLength: 4,
            keyboardType: TextInputType.number,
            decoration: new InputDecoration(
                counterText: '',
                labelText: StringHelper.label_otp,
                labelStyle: TextStyle(fontSize: 15),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorsHelper.blue())),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorsHelper.blue()))),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            StringHelper.label_did_not_get_otp,
            style: TextStyle(color: ColorsHelper.blue(), fontSize: 10),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          FlatButton(
              onPressed: () => resendOTPPressed(),
              child: Text(StringHelper.label_resend_otp,
                  style: TextStyle(color: ColorsHelper.blue(), fontSize: 12))),
          Padding(padding: EdgeInsets.only(top: 10)),
          ButtonTheme(
              minWidth: 200,
              child: new RaisedButton(
                textColor: ColorsHelper.white(),
                color: ColorsHelper.orange(),
                child: new Text(StringHelper.btn_verify),
                onPressed: () => verifyOTPPressed(),
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ))
        ],
      ),
    );
  }

  void verifyOTPPressed() {
    if (_formKey.currentState.validate()) {
      if (isFrom == OTPValidationIsFrom.SIGN_UP.index) {
        apiCallValidateOTP();
      } else {
//        apiCallValidateForgetPassOTP();
      }
    }
  }

  void apiCallValidateOTP() async {

     OTPResponse response = await App.apiHelper
        .validateOTP(context, mobileNum, empCode, _otpController.text);


    if (response.s) {
      Navigator.of(context).push(new SlideLeftRoute(
          widget: new SignUpForm(mobileNum, response.d.employee)));
    } else {

      Utils.showAlertDialog(context: context,message: response.e);
    }
  }

  void resendOTPPressed() async {

    BaseResponse response = await App.apiHelper.regenerateOtp(context,mobileNum);

    if (response.s) {
      Utils.showAlertDialog(context: context,message: StringHelper.msg_otp_resent_successfully);
    } else {
      Utils.showAlertDialog(context: context,message: response.e);

    }
  }
}
