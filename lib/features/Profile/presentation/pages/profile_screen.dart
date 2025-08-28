import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psdigital_task/core/extensions/sizedbox_extensions.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/app_text.dart';
import 'package:psdigital_task/features/Profile/presentation/widgets/icons_widget.dart';
import 'package:psdigital_task/features/Profile/presentation/widgets/list_profile.dart';
import 'package:psdigital_task/features/Profile/presentation/widgets/list_with_toogle.dart';
import 'package:psdigital_task/features/Profile/presentation/widgets/profile_headr.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.onBackToMenu});
  final VoidCallback onBackToMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
          backgroundColor: AppColor.white,
          centerTitle: false,
          scrolledUnderElevation: 0,
          elevation: 0,
          title: Text(
            'Profile',
            style: AppText.bikerDiamond,
          ),
          leadingWidth: 53.w,
          leading: GestureDetector(
            onTap: () => onBackToMenu(),
            child: Padding(
              padding: EdgeInsets.only(left: 17.w),
              child: Container(
                width: 36.w,
                height: 36.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF2F3F6),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 17.w,
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: AppColor.lightgray,
              thickness: 6.h,
            ),
            const ProfileHeadr(),
            verticalSpace(20),
            const IconsWidget(),
            Divider(
              color: AppColor.lightgray,
              thickness: 11.h,
            ),
            const ListProfile(),
            Divider(
              color: AppColor.lightgray,
              thickness: 11.h,
            ),
            const ListWithToogle()
          ],
        ),
      ),
    );
  }
}
