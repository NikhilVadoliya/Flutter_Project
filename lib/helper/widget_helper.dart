import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/image_assets.dart';
import 'package:app_demo/helper/string.dart';
import 'package:flutter/material.dart';

class WidgetHelper{
  static Widget logoFields() {
    return new Column(
      children: <Widget>[
        new Image.asset(
          ImageAssets.iaa_logo,
          fit: BoxFit.cover,
        ),
        Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  StringHelper.app_name_full,
                  style: TextStyle(fontSize: 15, color: ColorsHelper.blue()),
                ),
                Text(
                  StringHelper.app_name,
                  style: TextStyle(
                      fontSize: 16,
                      color: ColorsHelper.blue(),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ))
      ],
    );
  }
}