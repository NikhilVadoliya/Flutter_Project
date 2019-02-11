import 'package:app_demo/helper/string.dart';
import 'package:app_demo/widget/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

MaterialColor appColor() {
  return new MaterialColor(0xFF0498C1, {
    50: new Color(0xFFE1F3F8),
    100: new Color(0xFFB4E0EC),
    200: new Color(0xFF82CCE0),
    300: new Color(0xFF4FB7D4),
    400: new Color(0xFF2AA7CA),
    500: new Color(0xFF0498C1),
    600: new Color(0xFF0390BB),
    700: new Color(0xFF0385B3),
    800: new Color(0xFF027BAB),
    900: new Color(0xFF016A9E)
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringHelper.app_name_full,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: appColor(),
          scaffoldBackgroundColor: Colors.white,
          buttonColor: Colors.amber,
          cursorColor: Colors.amber),
      home: SplashScreen(),
    );
  }
}
