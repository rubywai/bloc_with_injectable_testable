import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

enum AppTheme {
 Light,
  Dark,
  Auto
}

final appThemeData = {
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.red),
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.red)
    )

  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow
      ),
      textTheme: TextTheme(
          headline6: TextStyle(color: Colors.blue)
      )
  ),
  AppTheme.Auto : ThemeData(
    brightness: SchedulerBinding.instance.window.platformBrightness
  )

};