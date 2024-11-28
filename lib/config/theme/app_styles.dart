import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/config/theme/app_theme.dart';
import 'package:news_app/core/colors_manager.dart';

class AppStyles {
  static TextStyle appBar = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.white,
  );
  static TextStyle drawerTitle = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.white,
  );
  static TextStyle drawerItems = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.blackUi,
  );
  static TextStyle categoryTitle = GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.grey,
  );
  static TextStyle categoryItem = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.white,
  );
  static TextStyle selectedLabel = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.white,
  );
  static TextStyle unSelectedLabel = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.blackUi,
  );
  static TextStyle sourceName = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.blackUi,
  );
  static TextStyle articleTitle = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.blackUi,
  );
  static TextStyle publishedAt = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.blackUi,
  );
  static TextStyle articleDescription = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.blackUi,
  );
  static TextStyle articleContent = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.blackUi,
  );
  static TextStyle btnArticleDetails = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
}
