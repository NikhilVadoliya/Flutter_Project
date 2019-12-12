import 'package:app_demo/helper/color_helper.dart';
import 'package:app_demo/helper/string.dart';
import 'package:app_demo/widget/authentication/login.dart';
import 'package:flutter/material.dart';

class SignUpComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {},
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                flex: 10,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      StringHelper.label_awesome,
                      style: TextStyle(
                          color: ColorsHelper.blueLight(),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      StringHelper.label_sign_up_complete,
                      style: TextStyle(
                          color: ColorsHelper.blueLight(), fontSize: 20),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Image(
                      image: new AssetImage('assets/images/ic_watch.png'),
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      top: 10,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(right: 50, left: 50),
                      child: Text(
                        StringHelper.label_sign_up_complete_24,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsHelper.blueLight(),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: FlatButton(
                  onPressed: () => _onLoginClick(context),
                  child: Text(
                    StringHelper.label_or_login,
                    style: TextStyle(color: ColorsHelper.orange()),
                    textAlign: TextAlign.end,
                  ),
                ),
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }

  _onLoginClick(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => Login()),
        ModalRoute.withName('/'));
  }
}
