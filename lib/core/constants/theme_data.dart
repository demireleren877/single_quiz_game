import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'color_constants.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        primary: AppColors.btnColor,
        textStyle:
            context.textTheme.headline5?.copyWith(color: AppColors.white),
      ),
    ),
    scaffoldBackgroundColor: AppColors.primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.blue, size: 50.sp),
      backgroundColor: AppColors.transparent,
      elevation: 0,
      centerTitle: true,
      shadowColor: AppColors.transparent,
    ),
    iconTheme: IconThemeData(size: 30.sp),
  );
}
