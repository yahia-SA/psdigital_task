import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/app_text.dart';
import 'package:psdigital_task/features/Profile/presentation/widgets/toogle_widget.dart';

class ListWithToogle extends StatefulWidget {
  const ListWithToogle({
    super.key,
  });

  @override
  State<ListWithToogle> createState() => _ListWithToogleState();
}

class _ListWithToogleState extends State<ListWithToogle> {
  bool activeMarketing = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          ListTile(
            trailing: ToogleWidget(
              isActive: activeMarketing,
              onChanged: (value) => setState(() => activeMarketing = value),
            ),
            leading: SvgPicture.asset(
              'assets/icons/List/Marketing.svg',
            ),
            title: Text(
              'Marketing Communication',
              style: AppText.semiBold18,
            ),
            subtitle: Text(
              'Once you open it you will receive emails and offer on your inbox ',
              style: AppText.regular16.copyWith(color: AppColor.darkGray),
            ),
          ),
          const Divider(),
          ListTile(
            trailing: ToogleWidget(
              isActive: !activeMarketing,
              onChanged: (value) => setState(() => activeMarketing = value),
            ),
            leading: SvgPicture.asset(
              'assets/icons/List/phone.svg',
            ),
            title: Text(
              'App Communication',
              style: AppText.semiBold18,
            ),
            subtitle: Text(
              'Once you open it you will receive Notifications from our app',
              style: AppText.regular16.copyWith(color: AppColor.darkGray),
            ),
          )
        ],
      ),
    );
  }
}
