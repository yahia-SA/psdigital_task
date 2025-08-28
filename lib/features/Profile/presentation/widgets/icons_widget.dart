import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:psdigital_task/core/extensions/sizedbox_extensions.dart';
import 'package:psdigital_task/core/routing/app_router.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/app_text.dart';
import 'package:psdigital_task/features/Profile/presentation/pages/profile_screen.dart';

class IconsWidget extends StatelessWidget {
  const IconsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {'icon': 'assets/icons/Favorites.svg', 'label': 'Favorites'},
      {'icon': 'assets/icons/Rewards.svg', 'label': 'Rewards'},
      {'icon': 'assets/icons/Orders.svg', 'label': 'Orders'},
    ];
    return SizedBox(
      width: 401.w,
      height: 124.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              // Navigator.of(context).push(AppRouter().createRoute(
              //   ProfileScreen(
              //     onBackToMenu: () {},
              //   ),
              // ));
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 9.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(item['icon']!),
                  verticalSpace(4),
                  Text(
                    item['label']!,
                    style: AppText.semiBold18.copyWith(
                      color: AppColor.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
