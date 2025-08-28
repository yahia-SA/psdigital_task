import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psdigital_task/core/extensions/sizedbox_extensions.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/app_text.dart';
import 'package:psdigital_task/core/utils/injection_container.dart';
import 'package:psdigital_task/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:psdigital_task/features/menu/presentation/widgets/category_row.dart';
import 'package:psdigital_task/features/menu/presentation/widgets/category_title.dart';
import 'package:psdigital_task/features/menu/presentation/widgets/item_list.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MenuCubit>()..getMenus(),
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          centerTitle: false,
          scrolledUnderElevation: 0,
          elevation: 0,
          title: Text(
            'Explore Menu',
            style: AppText.bikerDiamond,
          ),
          actions: [
            //             BlocBuilder<CartCubit, CartState>(
            //   builder: (context, cartState) {
            //     final totalItems = context.read<CartCubit>().totalItems;
            //     return Stack(
            //       children: [
            //         IconButton(
            //           onPressed: () {
            //           },
            //           icon: Icon(
            //             Icons.shopping_cart,
            //             color: totalItems > 0 ? AppColor.orange : Colors.grey,
            //             size: 24.w,
            //           ),
            //         ),
            //         if (totalItems > 0)
            //           Positioned(
            //             right: 6,
            //             top: 6,
            //             child: Container(
            //               padding: EdgeInsets.all(2.w),
            //               decoration: BoxDecoration(
            //                 color: AppColor.orange,
            //                 borderRadius: BorderRadius.circular(10.r),
            //               ),
            //               constraints: BoxConstraints(
            //                 minWidth: 16.w,
            //                 minHeight: 16.h,
            //               ),
            //               child: Text(
            //                 '$totalItems',
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 12.sp,
            //                 ),
            //                 textAlign: TextAlign.center,
            //               ),
            //             ),
            //           ),
            //       ],
            //     );
            //   },
            // ),

            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 24.w,
              ),
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: BlocBuilder<MenuCubit, MenuState>(
              builder: (context, state) {
                if (state is MenuLoading) {
                  return const Center(
                      child: CircularProgressIndicator(color: AppColor.orange));
                } else if (state is MenuError) {
                  return Center(
                      child: Text(state.message,
                          style: AppText.bold20.copyWith(color: Colors.red)));
                } else if (state is MenuLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Categories Row
                      CategoriesRow(
                        selectedCategory: state.selectedCategory,
                      ),
                      verticalSpace(29),

                      /// Category Title
                      CategoryTitle(
                        title: state.selectedCategory.displayName,
                        length: state.filteredItems.length,
                      ),
                      verticalSpace(24),

                      /// Items List
                      Expanded(
                        child: ItemsList(
                          length: state.filteredItems.length,
                          items: state.filteredItems,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            )),
      ),
    );
  }
}
