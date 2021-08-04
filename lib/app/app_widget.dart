import 'package:flutter/material.dart';

import 'package:bloc_flutter/app/home/home_page.dart';
import 'package:bloc_flutter/app/home/module.dart' as home;

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    home.initModule();
  }

  @override
  void dispose() {
    super.dispose();
    home.disposeModule();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
