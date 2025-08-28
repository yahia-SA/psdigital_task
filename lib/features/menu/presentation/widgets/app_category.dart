import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psdigital_task/core/extensions/sizedbox_extensions.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/app_text.dart';

class AppCategory extends StatelessWidget {
  const AppCategory({super.key, required this.label, required this.icon, this.isSelected = false, required this.onTap});
  final String label;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 31.h,
        padding: EdgeInsets.fromLTRB(2.w, 3.h, 15.w, 3.h),
        decoration: BoxDecoration(
      color: isSelected ? AppColor.orange : AppColor.white,
      borderRadius: BorderRadius.circular(29.r),
      border: Border.all(
        color: AppColor.orange, 
        width: 1.w,
      ),
        ),
        child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(icon , style:AppText.semiBold18), 
        horizontalSpace(6), 
        Text(
          label,
          style: AppText.semiBold18,
        ),
      ],
        ),
      ),
    );
  }
}