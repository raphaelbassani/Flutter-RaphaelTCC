import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:raphael_tcc/view_models/name_view_model.dart';
import 'package:raphael_tcc/view_models/task_view_model.dart';
import 'package:raphael_tcc/views/task_page.dart';

import 'controllers/constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NameViewModel()),
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raphael TCC',
      theme: ThemeData(
        backgroundColor: Constants.backgroundColor,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Constants.textColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Constants.textColor,
            fontSize: 14,
          ),
        ),
      ),
      home: TaskPage(),
    );
  }
}
