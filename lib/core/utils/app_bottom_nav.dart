import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psdigital_task/core/extensions/sizedbox_extensions.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psdigital_task/core/theme/app_text.dart';
import 'package:psdigital_task/core/utils/injection_container.dart';
import 'package:psdigital_task/core/utils/triangle_painter.dart';
import 'package:psdigital_task/features/Profile/presentation/pages/profile_screen.dart';
import 'package:psdigital_task/features/menu/presentation/cubit/cart_cubit.dart';
import 'package:psdigital_task/features/menu/presentation/pages/menu_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages.addAll([
      SizedBox(
          child: Center(
        child: Text('Home', style: AppText.regular16Black),
      )),
      const MenuScreen(),
      SizedBox(
          child: Center(
        child: Text('Cart', style: AppText.regular16Black),
      )),
      ProfileScreen(
        onBackToMenu: () => setState(() => _selectedIndex = 1),
      ),
      SizedBox(
          child: Center(
        child: Text('More', style: AppText.regular16Black),
      )),
    ]);
  }

  final labels = ['Home', 'Menu', ' ', 'Profile', 'More'];
  final icons = [
    'assets/icons/Home.svg',
    'assets/icons/Menu.svg',
    'assets/icons/Cart.svg',
    'assets/icons/Profile.svg',
    'assets/icons/More.svg',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartCubit>(),
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: buildCustomBottomNavigation(),
      ),
    );
  }

  Widget buildCustomBottomNavigation() {
    return Container(
      height: 99.h,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29C8C8C8),
            blurRadius: 16,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          icons.length,
          (index) {
            final isActive = _selectedIndex == index;
            final color = index == 2
                ? null
                : (isActive ? AppColor.orange : AppColor.black);

            return Expanded(
              child: GestureDetector(
                onTap: () => index == 2 ? null : _onItemTapped(index),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            icons[index],
                            color: color,
                            height: index == 2 ? 68.h : null,
                            fit: BoxFit.contain,
                          ),
                          if (index == 2)
                            BlocBuilder<CartCubit, CartState>(
                              builder: (context, state) {
                                final total =
                                    context.read<CartCubit>().totalPrice;
                                if (total == 0) return const SizedBox.shrink();

                                return Positioned(
                                  bottom: 50.h,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 155.w,
                                        height: 37.h,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.w, vertical: 7.h),
                                        decoration: BoxDecoration(
                                          color: AppColor
                                              .redColor, // أحمر مثل الصورة
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              blurRadius: 8,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                Opacity(
                                                  opacity: 0.2,
                                                  child: Icon(
                                                    Icons.shopping_bag_outlined,
                                                    color: AppColor.white,
                                                    size: 28.w,
                                                  ),
                                                ),
                                                Text('View Cart',
                                                    style: AppText.semiBold18
                                                        .copyWith(
                                                            color: AppColor
                                                                .white)),
                                              ],
                                            ),
                                            Text(
                                              '$total BD',
                                              style: AppText.semiBold18
                                                  .copyWith(
                                                      color: AppColor.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomPaint(
                                        size: Size(19.w, 21.h),
                                        painter: const TrianglePainter(
                                            color: AppColor.redColor),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                      verticalSpace(2),
                      Text(
                        labels[index],
                        style: AppText.semiBold14,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
