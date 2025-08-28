import 'package:psdigital_task/features/menu/domain/entities/menu_item_entity.dart';
import 'package:psdigital_task/features/menu/domain/repositories/menu_repository.dart';

class MenuUsecase {
  MenuUsecase(this.repository);
  final MenuRepository repository;
  Future <List<MenuItemEntity>> call() => repository.getMenus();
  
}