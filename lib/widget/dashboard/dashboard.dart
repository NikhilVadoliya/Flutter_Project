import 'dart:convert';


import 'package:app_demo/data_manager.dart';
import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/shareprefrenceshelper.dart';
import 'package:app_demo/helper/string.dart';
import 'package:app_demo/helper/utils.dart';
import 'package:app_demo/interfaces/dialog_callback.dart';
import 'package:app_demo/interfaces/update_profile_listener.dart';
import 'package:app_demo/model/responses/login_response.dart';
import 'package:app_demo/model/responses/updated_profile_response.dart';
import 'package:app_demo/widget/authentication/login.dart';
import 'package:app_demo/widget/dashboard/about.dart';
import 'package:app_demo/widget/dashboard/profile.dart';
import 'package:app_demo/widget/dashboard/training.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    implements DialogCallBack, OnUpdateProfile {
  int _selectedDrawerIndex = 0;
  String title = StringHelper.label_training;
  String userName = '';
  List<Widget> trainingWidget, profileWidget, aboutWidget, actionWidget;
  StatefulWidget statefulWidget;

  @override
  void initState() {
    super.initState();
    getUserName();

    trainingWidget = new List();
    aboutWidget = new List();
    profileWidget = new List();
    actionWidget = new List();
    actionWidget = trainingWidget;
    trainingWidget.add(
        IconButton(icon: Icon(Icons.image), onPressed: () => _onFilterClick()));
    trainingWidget.add(IconButton(
        icon: Icon(Icons.search), onPressed: () => _onSearchClick()));

    profileWidget.add(
        IconButton(icon: Icon(Icons.create), onPressed: () => _onEditClick()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsHelper.blue(),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        actions: actionWidget,
        elevation: 0.0,
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
      drawer: new Drawer(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                userName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorsHelper.white(),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              color: ColorsHelper.blue(),
              height: 70,
              width: double.infinity,
              alignment: Alignment(0, 0.5),
            ),
            ListTile(
              title: Text(StringHelper.label_training),
              selected: _selectedDrawerIndex == 0,
              onTap: () {
                _onDrawerItemClick(0);
              },
            ),
            ListTile(
              title: Text(StringHelper.label_profile),
              selected: _selectedDrawerIndex == 1,
              onTap: () {
                _onDrawerItemClick(1);
              },
            ),
            ListTile(
              title: Text(StringHelper.label_about),
              selected: _selectedDrawerIndex == 2,
              onTap: () {
                _onDrawerItemClick(2);
              },
            ),
            ListTile(
              title: Text(StringHelper.label_logout),
              selected: false,
              onTap: () {
                Utils.showAlertDialogCallBack(
                    context: context,
                    listener: this,
                    message: StringHelper.error_msg_logout,
                    navBtnName: StringHelper.btn_no,
                    posBtnName: StringHelper.btn_yes);
              },
            )
          ],
        ),
      ),
    );
  }

  _onDrawerItemClick(int index) {
    setState(() {
      _selectedDrawerIndex = index;
      switch (index) {
        case 0:
          title = StringHelper.label_training;
          actionWidget = trainingWidget;
          break;
        case 1:
          title = StringHelper.label_profile;
          actionWidget = profileWidget;
          break;
        case 2:
          title = StringHelper.label_about;
          actionWidget = aboutWidget;
          break;
      }
    });
    //to close drawer
    Navigator.of(context).pop();
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        statefulWidget = new Training();
        return new Training();
      case 1:
        statefulWidget = new Profile(this);
        return new Center(child: statefulWidget);
      case 2:
        statefulWidget = new About();
        return new About();

      default:
        return new Text("Error");
    }
  }

  @override
  void onNagClick() {
    Navigator.pop(context);
  }

  @override
  void onPosClick() {
    Navigator.pop(context);
    DataManager.of(context).apiHelper.logOut(context).then((response) {
      if (response.s) {
        SharePreferencesHelper.getInstant().clearPreference();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Login()),
          ModalRoute.withName('/'),
        );
        /* Navigator.of(context)
            .pushReplacement(new SlideRightRoute(widget: new DashBoard()));*/
      } else {
        Utils.showAlertDialog(context: context, message: response.e);
      }
    });
  }

  void getUserName() async {
    String response = await SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.USER_DATA);
    LoginResponse loginResponse =
        new LoginResponse.fromJson(jsonDecode(response));
    setState(() {
      if (loginResponse != null) userName = loginResponse.user.name;
    });
  }

  _onFilterClick() {}

  _onSearchClick() {}

  _onEditClick() {
//    Profile(this).onEditClick();
  }

  @override
  void onUpdateProfile(UpdateProfileResponse userData) {
    setState(() {
      userName = '${userData.d.first_name} ${userData.d.last_name}';
    });
  }
}
