import 'dart:convert';
import 'dart:io';

import 'package:app_demo/helper/const.dart';
import 'package:app_demo/helper/progressbar_helper.dart';
import 'package:app_demo/helper/shareprefrenceshelper.dart';
import 'package:app_demo/helper/string.dart';
import 'package:app_demo/helper/utils.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Api {
  Map<String, String> header;

  Future<http.Response> login(BuildContext context, String urlPath,
      Map<String, dynamic> requestData) async {
    header = await getHeader();
    Response response = await http.post(Constants.BaseUri + urlPath,
        headers: header, body: json.encode(requestData));

    print('request url :${response.request.method}  ${response.request.url}');
    print('request header : ${response.request.headers}');
    print('request body : ${requestData.toString()}');
    print('response header : ${response.headers}');
    print('response statusCode : ${response.statusCode}');
    print('response body : ${response.body}');

    if (response == null) {
      Utils.showAlertDialog(context: context, message: 0);
      return null;
    }
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 500) {
      Navigator.pop(context);

      Utils.showAlertDialog(
          context: context, message: StringHelper.error_msg_internal_server);
      return null;
    } else {
      Navigator.pop(context);
      Utils.showAlertDialog(context: context, message: 0);
      return null;
    }
  }

  Future<http.Response> postApi(
      {@required BuildContext context,
      bool isProgressBar,
      String urlPath,
      Map<String, dynamic> requestData}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      if (isProgressBar) {
        ProgressBar.progressBarShow(context);
      }
      header = await getHeader();
      Response response;
      if (requestData == null) {
        response =
            await http.post(Constants.BaseUri + urlPath, headers: header);
      } else {
        response = await http.post(Constants.BaseUri + urlPath,
            headers: header, body: json.encode(requestData));
      }

      print('request url :${response.request.method}  ${response.request.url}');
      print('request header : ${response.request.headers}');
      print('request data:${requestData.toString()}');
      print('response header : ${response.headers}');
      print('response statusCode : ${response.statusCode}');
      print('response body : ${response.body}');

      if (isProgressBar) {
        ProgressBar.progressBarHide(context);
      }
      if (response == null) {
        Utils.showAlertDialog(context: context, message: 0);
        return null;
      }
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 500) {
        Utils.showAlertDialog(
            context: context,
            message: StringHelper.error_msg_internal_server);
        return null;
      } else {
        Utils.showAlertDialog(context: context, message: 0);
        return null;
      }
    } else {
      Utils.showAlertDialog(
          context: context,
          message: StringHelper.error_msg_connection_internet);
    }
  }

  Future<http.Response> getApi(
      {@required BuildContext context,
      bool isProgressBar,
      String urlPath}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      if (isProgressBar) {
        ProgressBar.progressBarShow(context);
      }
      header = await getHeader();
      Response response =
          await http.get(Constants.BaseUri + urlPath, headers: header);

      print('request url :${response.request.method}  ${response.request.url}');
      print('request header : ${response.request.headers}');
      print('response header : ${response.headers}');
      print('response statusCode : ${response.statusCode}');
      debugPrint('response body : ${response.body.toString()}');

      if (isProgressBar) {
        ProgressBar.progressBarHide(context);
      }
      if (response == null) {
        Utils.showAlertDialog(context: context, message: 0);
        return null;
      }
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 500) {
        Utils.showAlertDialog(
            context: context, message: StringHelper.error_msg_internal_server);

        return null;
      } else {
        Utils.showAlertDialog(context: context, message: 0);
        return null;
      }
    } else {
      Utils.showAlertDialog(
          context: context,
          message: StringHelper.error_msg_connection_internet);
    }
  }

  Future<Map<String, String>> getHeader() async {
    if (header == null) {
      header = new Map<String, String>();
    } else {
      header.clear();
    }
    header[Constants.header_content] = 'application/json';
    header[Constants.header_os_version] =
        await SharePreferencesHelper.getInstant()
            .getString(SharePreferencesHelper.OS_VERSION);

    header[Constants.header_os] = Platform.isAndroid ? 'Android' : 'IOS';
    header[Constants.header_app_version] = '1.0';
    header[Constants.header_device_type] = '1.0';
    header[Constants.header_access_token] =
        await SharePreferencesHelper.getInstant()
            .getString(SharePreferencesHelper.ACCESS_TOKEN);
    header[Constants.header_device_token] = '12312312312345456987987412';

    return header;
  }
}
