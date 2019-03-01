import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _mobileController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  String mobile;
  String password;

  _LoginFormState() {
    _mobileController.addListener(_mobileListener);
    _passwordController.addListener(_passwordListener);
  }

  void _mobileListener() {
    if (_mobileController.text.isEmpty) {
      mobile = "";
    } else {
      mobile = _mobileController.text;
    }
  }

  void _passwordListener() {
    if (_passwordController.text.isEmpty) {
      password = "";
    } else {
      password = _passwordController.text;
    }
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
                new Text('Forgot password?')
              ],
            ),
          )
        ],
      ),
    ));
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
