import 'package:flutter/material.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText {
  static TextStyle bikerDiamond = TextStyle(
    fontFamily:  'BikerDiamond',
    fontWeight: FontWeight.w400,
    fontSize: 18.sp,
    height: 1.0.h,
    letterSpacing: 0,
    color: AppColor.black,
  );
    // SemiBold 18px - 100% line height (most common)
  static TextStyle semiBold18 = TextStyle(
    fontFamily: 'TexasChickenGothicCnd',
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    height: 1.0.h,
    letterSpacing: 0,
    color: AppColor.black,
  );

  // Bold 22px - 100% line height
  static TextStyle bold22 = TextStyle(
    fontFamily: 'TexasChickenGothicCnd',
    fontWeight: FontWeight.w700,
    fontSize: 22.sp,
    height: 1.0.h,
    letterSpacing: 0,
  );

  // Regular 16px - 100% line height
  static TextStyle regular16 = TextStyle(
    fontFamily: 'TexasChickenGothicCnd',
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    height: 1.0.h,
    letterSpacing: 0,
  );

  // Bold 20px - 100% line height
  static TextStyle bold20 = TextStyle(
    fontFamily: 'TexasChickenGothicCnd',
    fontWeight: FontWeight.w700,
    fontSize: 20.sp,
    height: 1.0.h,
    letterSpacing: 0,
  );

  // Bold 18px - 100% line height
  static TextStyle bold18 = TextStyle(
    fontFamily: 'TexasChickenGothicCnd',
    fontWeight: FontWeight.w700,
    fontSize: 18.sp,
    height: 1.0.h,
    letterSpacing: 0,
  );

  // Regular 16px with line-through decoration
  static TextStyle regular16LineThrough = TextStyle(
    fontFamily: 'TexasChickenGothicCnd',
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    height: 12.9 / 16, // 12.9px line height converted to ratio
    letterSpacing: 0,
    decoration: TextDecoration.lineThrough,
  );

  // ExtraBold 20px - 100% line height
  static TextStyle extraBold20 = TextStyle(
    fontFamily: 'TexasChickenGothicCnd',
    fontWeight: FontWeight.w800,
    fontSize: 20.sp,
    height: 1.0.h,
    letterSpacing: 0,
  );

  // SemiBold 14px with 16px line height
  static TextStyle semiBold14 = TextStyle(
    fontFamily: 'TexasChickenGothicCnd',
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    height: 16 / 14, // 16px line height converted to ratio
    letterSpacing: 0,
    color: AppColor.darkGray,
  );


  static TextStyle bold16 = TextStyle(
    fontFamily: 'TexasChickenGothicCnd',
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    height: 1.0.h,
    letterSpacing: 0,
  );

  static TextStyle bold20White = TextStyle(
    fontFamily: 'TexasChickenGothicCnd',
    fontWeight: FontWeight.w700,
    fontSize: 20.sp,
    height: 1.0.h,
    letterSpacing: 0,
    color: Colors.white,
  );

  static TextStyle regular16Black = TextStyle(
    fontFamily: 'TexasChickenGothicCnd',
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    height: 1.0.h,
    letterSpacing: 0,
    color: Colors.black,
  );


}
