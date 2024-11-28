import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/colors_manager.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: ColorsManager.green,
    appBarTheme: AppBarTheme(
        toolbarHeight: 85.h,
        iconTheme: const IconThemeData(
          color: ColorsManager.white,
          size: 35,
        ),
        centerTitle: true,
        color: ColorsManager.green,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40.r))),
        titleTextStyle: AppStyles.appBar),
    scaffoldBackgroundColor: Colors.transparent,
  );
}
