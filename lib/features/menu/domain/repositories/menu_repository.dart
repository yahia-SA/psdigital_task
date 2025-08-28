import 'package:psdigital_task/features/menu/domain/entities/menu_item_entity.dart';

abstract class MenuRepository {
  Future<List<MenuItemEntity>> getMenus();
}