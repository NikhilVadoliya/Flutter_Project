import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/date_format_base.dart';
import 'package:app_demo/helper/shareprefrenceshelper.dart';
import 'package:app_demo/helper/string.dart';
import 'package:app_demo/interfaces/dialog_callback.dart';
import 'package:app_demo/widget/authentication/login.dart';
import 'package:flutter/material.dart';

class Utils {
  static showAlertDialog({@required BuildContext context, var message = 0}) {
    String dialogMessage;
    if (message is String) {
      dialogMessage = message;
    } else if (message is int) {
      dialogMessage = getErrorMessage(message);
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                StringHelper.app_name,
                style: TextStyle(color: ColorsHelper.blue()),
              ),
              content: Text(
                dialogMessage,
                style: TextStyle(fontSize: 12),
              ),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => _onOKClick(context, message),
                  child: Text('OK',
                      style: TextStyle(
                          color: ColorsHelper.blue(),
                          fontWeight: FontWeight.bold)),
                )
              ]);
        });
  }

  static _onOKClick(BuildContext context, var message) {
    Navigator.pop(context);
    if (message is int && message == 16) {
      _onLogOut(context);
    }
  }

  static String getErrorMessage(int errorCode) {
    switch (errorCode) {
      case 0:
        return StringHelper.error_code_0;
      case 1:
        return StringHelper.error_code_1;
      case 2:
        return StringHelper.error_code_2;
      case 3:
        return StringHelper.error_code_3;
      case 4:
        return StringHelper.error_code_4;
      case 5:
        return StringHelper.error_code_5;
      case 6:
        return StringHelper.error_code_6;
      case 7:
        return StringHelper.error_code_7;
      case 8:
        return StringHelper.error_code_8;
      case 9:
        return StringHelper.error_code_9;
      case 10:
        return StringHelper.error_code_10;
      case 11:
        return StringHelper.error_code_11;
      case 12:
        return StringHelper.error_code_12;
      case 13:
        return StringHelper.error_code_13;
      case 14:
        return StringHelper.error_code_14;
      case 15:
        return StringHelper.error_code_15;
      case 16:
        return StringHelper.error_code_16;
      case 17:
        return StringHelper.error_code_17;
      case 18:
        return StringHelper.error_code_18;
      case 19:
        return StringHelper.error_code_19;
      case 20:
        return StringHelper.error_code_20;
      case 21:
        return StringHelper.error_code_21;
      case 22:
        return StringHelper.error_code_22;
      case 23:
        return StringHelper.error_code_23;
      case 24:
        return StringHelper.error_code_24;
      case 25:
        return StringHelper.error_code_25;
      case 26:
        return StringHelper.error_code_26;
      case 27:
        return StringHelper.error_code_27;
      case 28:
        return StringHelper.error_code_28;
      case 29:
        return StringHelper.error_code_29;
      case 30:
        return StringHelper.error_code_30;
      case 1011:
        return StringHelper.error_code_1011;
      case 50001:
        return StringHelper.error_code_50001;
      default:
        return StringHelper.error_code_0;
    }
  }

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static showAlertDialogCallBack(
      {@required BuildContext context,
      var message = 0,
      String posBtnName,
      String navBtnName,
      @required DialogCallBack listener}) {
    String dialogMessage;
    if (message is String) {
      dialogMessage = message;
    } else if (message is int) {
      dialogMessage = getErrorMessage(message);
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                StringHelper.app_name,
                style: TextStyle(color: ColorsHelper.blue()),
              ),
              content: Text(
                dialogMessage,
                style: TextStyle(fontSize: 12),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => listener.onPosClick(),
                  child: Text(posBtnName,
                      style: TextStyle(
                          color: ColorsHelper.blue(),
                          fontWeight: FontWeight.bold)),
                ),
                FlatButton(
                  onPressed: () => listener.onNagClick(),
                  child: Text(navBtnName,
                      style: TextStyle(
                          color: ColorsHelper.blue(),
                          fontWeight: FontWeight.bold)),
                )
              ]);
        });
  }

  static void _onLogOut(BuildContext context) {
    SharePreferencesHelper.getInstant().clearPreference();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Login()),
      ModalRoute.withName('/'),
    );
  }

  static String timestampToStringDate(int timestamp) {
    DateTime date =
        new DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true);
    return '${date.day}-${date.month}-${date.year}';
  }

  static String timestampToStringTime(int timestamp) {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(timestamp);

    return '${formatDate(date, [HH, ':', mm, ' ', am])}';
  }

  static bool isBetweenDate(int startDate, int endDate) {
    DateTime currentDate = DateTime.now();
    DateTime dateStart =
        new DateTime.fromMillisecondsSinceEpoch(startDate, isUtc: true);
    DateTime dateEnd =
        new DateTime.fromMillisecondsSinceEpoch(startDate, isUtc: true);

    dateEnd.add(Duration(days: 1));
    int one = dateStart.compareTo(currentDate);
    int two = currentDate.compareTo(dateEnd);
    return (one * two) >= 0;
  }
}
