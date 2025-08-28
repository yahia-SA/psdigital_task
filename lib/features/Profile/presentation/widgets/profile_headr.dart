import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psdigital_task/core/extensions/sizedbox_extensions.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/app_text.dart';

class ProfileHeadr extends StatelessWidget {
  const ProfileHeadr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 408.w,
      height: 190.h,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(11.r),
        boxShadow: [
          const BoxShadow(
            color: AppColor.lightgray,
            blurRadius: 1, // spread of the shadow
            spreadRadius: 2,
            offset: Offset(0, 0), // x=0, y=4
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.w, top: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.redColor,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.power_settings_new,
                    color: AppColor.white,
                    size: 15.w,
                  ),
                ),
                horizontalSpace(5),
                Text(
                  'Logout',
                  style: AppText.semiBold18.copyWith(color: AppColor.darkGray),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Row(
              children: [
                Container(
                  width: 63.w,
                  height: 63.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.gray,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'A',
                    style: AppText.bold22
                        .copyWith(color: Colors.black, fontSize: 24.sp),
                  ),
                ),
                horizontalSpace(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ahmed Magdy',
                      style: AppText.bold18.copyWith(color: AppColor.black),
                    ),
                    verticalSpace(6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Egypt _flag.svg',
                          width: 33.w,
                          height: 33.w,
                        ),
                        horizontalSpace(5),
                        Text(
                          '012-000-00-663',
                          style: AppText.semiBold18
                              .copyWith(color: AppColor.black),
                        ),
                      ],
                    ),
                    horizontalSpace(5),
                    Text(
                      'ahmed@paradigmegypt.com',
                      style:
                          AppText.semiBold18.copyWith(color: AppColor.darkGray),
                    ),
                  ],
                )
              ],
            ),
          ),
          verticalSpace(24),
          Padding(
            padding: EdgeInsets.only(left: 40.w),
            child: Container(
              width: 320.w,
              height: 40.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.orange,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                'Update Profile',
                style: AppText.bold18.copyWith(color: AppColor.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
