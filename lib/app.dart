import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psdigital_task/core/constants/app_constants.dart';
import 'package:psdigital_task/core/utils/app_bottom_nav.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 925),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        home: BottomNavigation(),
      ),
    );
  }
}
