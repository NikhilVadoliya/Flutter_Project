import 'dart:async';

import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/shareprefrenceshelper.dart';
import 'package:app_demo/helper/string.dart';
import 'package:app_demo/pageRouter/slide_page_router.dart';
import 'package:app_demo/widget/authentication/login.dart';
import 'package:app_demo/widget/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  Splash createState() => new Splash();
}

class Splash extends State<SplashScreen> with SingleTickerProviderStateMixin {
//  AnimationController animationController;

  @override
  void initState() {
    /* animationController =
        new AnimationController(duration: widget.duration, vsync: this)
          ..forward()
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              navigatorPath(context);

              */ /*Navigator.push(
              context, new SlideRightRoute(builder: (context) => new Login()));*/ /*
            }
          });*/
    super.initState();

    Timer(Duration(seconds: 5), () {
      navigatorPath(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset(
              'assets/images/iaa_logo.png',
              fit: BoxFit.cover,
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      StringHelper.app_name_full,
                      style:
                          TextStyle(fontSize: 15, color: ColorsHelper.blue()),
                    ),
                    Text(
                      StringHelper.app_name,
                      style: TextStyle(
                          fontSize: 16,
                          color: ColorsHelper.blue(),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void navigatorPath(BuildContext context) {
    SharePreferencesHelper.getInstant()
        .getString(SharePreferencesHelper.ACCESS_TOKEN)
        .then((accessToken) {
      if (accessToken.isEmpty) {
        Navigator.of(context)
            .pushReplacement(new SlideRightRoute(widget: new Login()));
      } else {
        Navigator.of(context)
            .pushReplacement(new SlideRightRoute(widget: new DashBoard()));
      }
    });
  }
}
