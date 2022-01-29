import 'package:flutter/material.dart';
import 'package:new_flutter_calculator/widgets/calculator.dart';
import 'package:flutter/services.dart';
import 'package:new_flutter_calculator/utils/global_theme.dart';


Future main() async{
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza',
      theme: globalTheme(),
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}