import 'package:flutter/material.dart';

import '../../core/extension/date_extension.dart';


final GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

var now = DateTime.now();
final String nowDay = now.weekdayToFullString;

final List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

final TextEditingController name = TextEditingController();
final TextEditingController comment = TextEditingController();
final TextEditingController mail = TextEditingController();
final TextEditingController location = TextEditingController();
