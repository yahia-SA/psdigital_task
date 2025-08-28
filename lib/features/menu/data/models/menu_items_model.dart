import 'package:psdigital_task/features/menu/domain/entities/menu_item_entity.dart';
import 'package:psdigital_task/features/menu/domain/entities/menu_category.dart';

class MenuItemModel extends MenuItemEntity {
  const MenuItemModel({
    required super.itemID,
    required super.itemName,
    required super.itemDescription,
    required super.itemPrice,
    required super.restaurantName,
    required super.restaurantID,
    required super.imageUrl,
  });

  /// Create model from API JSON (snake/camel case resilient)
  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      itemID: _asInt(json['itemID'] ?? json['itemId']),
      itemName: (json['itemName'] ?? '').toString(),
      itemDescription: (json['itemDescription'] ?? '').toString(),
      itemPrice: _asInt(json['itemPrice']),
      restaurantName: (json['restaurantName'] ?? '').toString(),
      restaurantID: _asInt(json['restaurantID'] ?? json['restaurantId']),
      imageUrl: (json['imageUrl'] ?? '').toString(),
    );
  }

  /// Serialize to JSON for APIs / caches
  Map<String, dynamic> toJson() => {
        'itemID': itemID,
        'itemName': itemName,
        'itemDescription': itemDescription,
        'itemPrice': itemPrice,
        'restaurantName': restaurantName,
        'restaurantID': restaurantID,
        'imageUrl': imageUrl,
      };

  /// Copy with data-layer (kept for symmetry)
  @override
  MenuItemModel copyWith({
    int? itemID,
    String? itemName,
    String? itemDescription,
    int? itemPrice,
    String? restaurantName,
    int? restaurantID,
    String? imageUrl,
  }) {
    return MenuItemModel(
      itemID: itemID ?? this.itemID,
      itemName: itemName ?? this.itemName,
      itemDescription: itemDescription ?? this.itemDescription,
      itemPrice: itemPrice ?? this.itemPrice,
      restaurantName: restaurantName ?? this.restaurantName,
      restaurantID: restaurantID ?? this.restaurantID,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  /// Helpers for lists
  static List<MenuItemModel> listFromJson(List<dynamic> data) {
    return data
        .map((e) => MenuItemModel.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }

  static List<Map<String, dynamic>> listToJson(List<MenuItemModel> items) {
    return items.map((e) => e.toJson()).toList(growable: false);
  }

  /// Grouping helper often useful for UI sections
  static Map<int, List<MenuItemEntity>> groupByRestaurant(
      List<MenuItemEntity> items) {
    final map = <int, List<MenuItemEntity>>{};
    for (final item in items) {
      map.putIfAbsent(item.restaurantID, () => []).add(item);
    }
    return map;
  }

  /// Group by category for categorized menu display
  static Map<MenuCategory, List<MenuItemEntity>> groupByCategory(
      List<MenuItemEntity> items) {
    final map = <MenuCategory, List<MenuItemEntity>>{};
    for (final item in items) {
      map.putIfAbsent(item.category, () => []).add(item);
    }
    return map;
  }

  /// Filter items by category
  static List<MenuItemEntity> filterByCategory(
      List<MenuItemEntity> items, MenuCategory category) {
    if (category == MenuCategory.all) return items;
    return items.where((item) => item.category == category).toList();
  }

  /// Filter items by price range
  static List<MenuItemEntity> filterByPriceRange(
      List<MenuItemEntity> items, int minPrice, int maxPrice) {
    return items
        .where((item) => item.itemPrice >= minPrice && item.itemPrice <= maxPrice)
        .toList();
  }

  /// Filter vegetarian items
  static List<MenuItemEntity> filterVegetarian(List<MenuItemEntity> items) {
    return items.where((item) => item.isVegetarian).toList();
  }

  /// Search items by query
  static List<MenuItemEntity> searchItems(
      List<MenuItemEntity> items, String query) {
    if (query.isEmpty) return items;
    return items.where((item) => item.matchesSearch(query)).toList();
  }

  /// Sort items by price
  static List<MenuItemEntity> sortByPrice(
      List<MenuItemEntity> items, {bool ascending = true}) {
    final sorted = List<MenuItemEntity>.from(items);
    sorted.sort((a, b) => ascending 
        ? a.itemPrice.compareTo(b.itemPrice) 
        : b.itemPrice.compareTo(a.itemPrice));
    return sorted;
  }

  /// Sort items by name
  static List<MenuItemEntity> sortByName(
      List<MenuItemEntity> items, {bool ascending = true}) {
    final sorted = List<MenuItemEntity>.from(items);
    sorted.sort((a, b) => ascending 
        ? a.itemName.compareTo(b.itemName) 
        : b.itemName.compareTo(a.itemName));
    return sorted;
  }

  /// Get unique restaurants from items
  static List<String> getUniqueRestaurants(List<MenuItemEntity> items) {
    return items
        .map((item) => item.restaurantName)
        .toSet()
        .toList()
      ..sort();
  }

  /// Get price range (min, max) from items
  static (int min, int max) getPriceRange(List<MenuItemEntity> items) {
    if (items.isEmpty) return (0, 0);
    
    int min = items.first.itemPrice;
    int max = items.first.itemPrice;
    
    for (final item in items) {
      if (item.itemPrice < min) min = item.itemPrice;
      if (item.itemPrice > max) max = item.itemPrice;
    }
    
    return (min, max);
  }

  /// Get category counts for UI display
  static Map<MenuCategory, int> getCategoryCounts(List<MenuItemEntity> items) {
    final counts = <MenuCategory, int>{};
    
    for (final category in MenuCategory.values) {
      if (category == MenuCategory.all) {
        counts[category] = items.length;
      } else {
        counts[category] = items.where((item) => item.category == category).length;
      }
    }
    
    return counts;
  }
}

// -----------------------
// Internal utilities
// -----------------------
int _asInt(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}
