import 'package:flutter/material.dart';
import 'package:psdigital_task/core/extensions/sizedbox_extensions.dart';
import 'package:psdigital_task/features/menu/domain/entities/menu_item_entity.dart';
import 'package:psdigital_task/features/menu/presentation/widgets/app_card.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({
    super.key,
    required this.length,
    required this.items,
  });
final int length;
final List<MenuItemEntity> items;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: length,
      separatorBuilder: (_, __) => verticalSpace(16),
      itemBuilder: (context, index) {
        final item = items[index];
        return AppCard(
          key: ValueKey(item.itemID),
          itemId: item.itemID,
          title: item.itemName,
          iamgeUrl: item.imageUrl,
          detalis: item.itemDescription,
          price: item.itemPrice,
        );
      },
    );
  }
}
