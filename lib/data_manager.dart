import 'package:app_demo/api/api.dart';
import 'package:app_demo/api/api_helper.dart';
import 'package:flutter/widgets.dart';

class DataManager extends InheritedWidget {
  final Api api;
  final ApiHelper apiHelper;

  DataManager({
    this.api,
    this.apiHelper,
    Key key,
    Widget child,
  }) : super(key: key, child: child);

  static DataManager of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(DataManager);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
