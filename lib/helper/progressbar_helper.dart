import 'package:app_demo/helper/color_helper.dart';
import 'package:flutter/material.dart';

class ProgressBar {
  static progressBarShow(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => new WillPopScope(
          child: new SimpleDialog(
            contentPadding: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            children: [
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text(
                    'Loading',
                    style: TextStyle(color: ColorsHelper.blue()),
                  )
                ],
              ),
            ],
          ),
          onWillPop: () {}),
    );
  }
  static progressBarHide(BuildContext context) {
    Navigator.pop(context);
  }
}
