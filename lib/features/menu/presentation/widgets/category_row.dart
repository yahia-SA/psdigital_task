import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:psdigital_task/core/extensions/sizedbox_extensions.dart';
import 'package:psdigital_task/features/menu/domain/entities/menu_category.dart';
import 'package:psdigital_task/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:psdigital_task/features/menu/presentation/widgets/app_category.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    super.key,
    required this.selectedCategory,
  });
  final MenuCategory selectedCategory;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: MenuCategory.values.length,
        separatorBuilder: (_, __) => horizontalSpace(8),
        itemBuilder: (context, index) {
          final category = MenuCategory.values[index];
          return AppCategory(
            label: category.displayName,
            icon: category.icon,
            isSelected: category == selectedCategory,
            onTap: () => context.read<MenuCubit>().changeCategory(category),
          );
        },
      ),
    );
  }
}
