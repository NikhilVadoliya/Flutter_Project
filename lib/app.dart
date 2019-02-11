import 'package:app_demo/api/api.dart';
import 'package:app_demo/api/api_helper.dart';
import 'package:flutter/material.dart';

App app = new App();

class App {
  static final ApiHelper apiHelper = new ApiHelper();
  static final Api api = new Api();
  static final App _app = new App._internal();
  static String app_version;

  static BuildContext context;

  factory App() {
    return _app;
  }

  App._internal();
}
