import 'package:psdigital_task/core/constants/endpoint_constants.dart';
import 'package:psdigital_task/core/network/dio_consumer.dart';
import 'package:psdigital_task/features/menu/data/models/menu_items_model.dart';
import 'package:psdigital_task/features/menu/domain/entities/menu_item_entity.dart';

abstract class MenuRemoteDataSource {
  Future<List<MenuItemEntity>> fetchMenu();
}

class MenuRemoteDataSourceImpl implements MenuRemoteDataSource {
  MenuRemoteDataSourceImpl({required this.client});

  final DioConsumer client;

  @override
  Future<List<MenuItemEntity>> fetchMenu() async {
    try {
      final response = await client.get(EndpointConstants.menuItems);

      final data = response is Map<String, dynamic>
          ? response['data'] ?? response
          : response;

      if (data is List) {
        return MenuItemModel.listFromJson(data);
      } else {
        throw Exception('Unexpected response format: $data');
      }
    } catch (error) {
      throw Exception('Failed to fetch menu: $error');
    }
  }
}
