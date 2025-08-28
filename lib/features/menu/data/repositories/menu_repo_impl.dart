import 'package:psdigital_task/features/menu/data/datasources/menu_data_source.dart';
import 'package:psdigital_task/features/menu/domain/entities/menu_item_entity.dart';
import 'package:psdigital_task/features/menu/domain/repositories/menu_repository.dart';

class MenuRepositoryImpl implements MenuRepository {
  MenuRepositoryImpl({required this.remoteDataSource});

  final MenuRemoteDataSource remoteDataSource;
  @override
  Future<List<MenuItemEntity>> getMenus() async {
    final response =  await remoteDataSource.fetchMenu();
    return response;
  }
}