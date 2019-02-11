import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/string.dart';
import 'package:app_demo/helper/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  String appVersion = '';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 50)),
            WidgetHelper.logoFields(),
            Padding(padding: EdgeInsets.only(top: 30)),
            _textWidgetLabelAndValue(StringHelper.label_project_director,
                StringHelper.label_project_director_name),
            _textWidgetLabelAndValue(StringHelper.label_project_coordinator,
                StringHelper.label_project_coordinator_name),
            _textWidgetLabelAndValue(
                StringHelper.label_project_technical_support,
                StringHelper.label_project_technical_support_place),
            _textWidgetLabelAndValue(
                StringHelper.label_app_version, appVersion),
          ],
        ),
      ),
    );
  }

  _textWidgetLabelAndValue(String label, String value) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(color: ColorsHelper.blue(), fontSize: 16),
            ),
            Text(
              value,
              style: TextStyle(
                  color: ColorsHelper.blue(),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.only(bottom: 25))
          ],
        ),
      ),
    );
  }

  _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
    });
  }
}
