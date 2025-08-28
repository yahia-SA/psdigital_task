
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/app_text.dart';

class ListProfile extends StatelessWidget {
  const ListProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 338.h,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          _buildSettingsItem(
            icon: 'assets/icons/List/location.svg',
            title: 'My Addresses',
            onTap: () {},
          ),
          const Divider(),
          _buildSettingsItem(
            icon: 'assets/icons/List/Key.svg',
            title: 'Change Password',
            onTap: () {},
          ),
          const Divider(),
          _buildSettingsItem(
            icon: 'assets/icons/List/Star.svg',
            title: 'Offers',
            onTap: () {},
          ),
          const Divider(),
          _buildSettingsItem(
            icon: 'assets/icons/List/Deals.svg',
            title: 'Deals',
            onTap: () {},
          ),
          const Divider(),
          _buildSettingsItem(
            icon: 'assets/icons/List/Alarm.svg',
            title: 'Notifications',
            onTap: () {},
          ),
          const Divider(),
          _buildSettingsItem(
            icon: 'assets/icons/List/Person.svg',
            title: 'Delete my Account',
            onTap: () {},
            isDestructive: true,
          ),
        ],
      ),
    );
  }
}

Widget _buildSettingsItem({
  required String icon,
  required String title,
  required VoidCallback onTap,
  bool isDestructive = false,
}) {
  return ListTile(
    leading: SvgPicture.asset(
      icon,
      color: isDestructive ? AppColor.redColor : AppColor.black,
    ),
    title: Text(
      title,
      style: AppText.semiBold18.copyWith(
        color: isDestructive ? AppColor.redColor : AppColor.black,
      ),
    ),
    trailing: isDestructive
        ? null
        : Icon(
            Icons.arrow_forward_ios,
            size: 8.5.sp,
            color: AppColor.black,
          ),
    onTap: onTap,
  );
}
