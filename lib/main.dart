import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/app/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MainApp());
}
