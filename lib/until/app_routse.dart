import 'package:flutter/material.dart';
import 'package:rexam2_core/screen/add/add_data_screen.dart';
import 'package:rexam2_core/screen/home/home_screen.dart';
Map<String,WidgetBuilder>app_routse={
  '/':(context) => HomeScreen(),
  'add':(context) => AddScreen(),
};