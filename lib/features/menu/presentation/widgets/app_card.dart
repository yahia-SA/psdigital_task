import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psdigital_task/core/extensions/sizedbox_extensions.dart';
import 'package:psdigital_task/core/theme/app_colors.dart';
import 'package:psdigital_task/core/theme/app_text.dart';
import 'package:psdigital_task/features/menu/presentation/cubit/cart_cubit.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.itemId,
    required this.title,
    required this.iamgeUrl,
    required this.detalis,
    required this.price,
  });

  final int itemId;
  final String title;
  final String iamgeUrl;
  final String detalis;
  final int price;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        final cartCubit = context.read<CartCubit>();
        final quantity = cartCubit.getQuantity(itemId);
        final isFavorited = cartCubit.isFavorite(itemId);

        return Container(
          width: 396.w,
          height: 194.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              const BoxShadow(
                color: AppColor.lightgray,
                blurRadius: 1,
                spreadRadius: 2,
                offset: Offset(0, 0),
              ),
            ],
            color: AppColor.white,
          ),
          child: Row(
            children: [
              Container(
                width: 134.w,
                height: 194.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    iamgeUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColor.darkGray,
                        child: Icon(
                          Icons.fastfood,
                          size: 50.w,
                          color: AppColor.orange,
                        ),
                      );
                    },
                  ),
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: AppText.bold20.copyWith(
                                color: AppColor.black,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              cartCubit.toggleFavorite(itemId);
                              log('🤍 Favorite toggled for item $itemId: ${!isFavorited}');
                            },
                            child: Icon(
                              isFavorited
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 18.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: Text(
                        detalis,
                        style: AppText.regular16.copyWith(
                          color: AppColor.darkGray,
                        ),
                      ),
                    ),
                    // Customize button
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Customize',
                            style: AppText.bold18.copyWith(
                              color: AppColor.redColor,
                            ),
                          ),
                          horizontalSpace(4),
                          Container(
                            width: 16.w,
                            height: 16.h,
                            decoration: const BoxDecoration(
                              color: AppColor.redColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 10.w,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Price
                          Text(
                            '${(price * .9).toInt()} BD',
                            style: AppText.bold20.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '$price BD',
                            style: AppText.regular16LineThrough.copyWith(
                              color: AppColor.darkGray,
                            ),
                          ),
                          // Quantity Controls
                          quantity == 0
                              ? GestureDetector(
                                  onTap: () {
                                    cartCubit.addItem(
                                        itemId, (price * .9).toInt());
                                    log('total price: ${cartCubit.totalPrice}');
                                  },
                                  child: Container(
                                    width: 109.w,
                                    height: 38.h,
                                    decoration: BoxDecoration(
                                      color: AppColor.orange,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Icon(
                                                CupertinoIcons.add,
                                                size: 20.w,
                                                color: AppColor.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Add to Cart',
                                              style: AppText.semiBold18,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: 109.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      // Decrease button
                                      GestureDetector(
                                        onTap: () {
                                          cartCubit.decrementQuantity(itemId);
                                          log('total price: ${cartCubit.totalPrice}');
                                        },
                                        child: Container(
                                          width: 37.2.w,
                                          height: 38.h,
                                          decoration: BoxDecoration(
                                            color: AppColor.gray,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6.r),
                                            ),
                                          ),
                                          child: Icon(
                                            CupertinoIcons.delete_solid,
                                            size: 16.w,
                                            color: AppColor.black,
                                          ),
                                        ),
                                      ),
                                      // Quantity
                                      Text(
                                        quantity.toString(),
                                        style: AppText.bold16.copyWith(
                                          color: AppColor.black,
                                        ),
                                      ),
                                      // Increase button
                                      GestureDetector(
                                        onTap: () {
                                          cartCubit.incrementQuantity(itemId);
                                          log('total price: ${cartCubit.totalPrice}');
                                        },
                                        child: Container(
                                          width: 37.2.w,
                                          height: 38.h,
                                          decoration: BoxDecoration(
                                            color: AppColor.orange,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6.r),
                                            ),
                                          ),
                                          child: Icon(
                                            CupertinoIcons.add,
                                            size: 16.w,
                                            color: AppColor.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
