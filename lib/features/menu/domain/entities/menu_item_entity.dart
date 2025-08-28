import 'package:equatable/equatable.dart';
import 'package:psdigital_task/features/menu/domain/entities/menu_category.dart';

class MenuItemEntity extends Equatable {
  const MenuItemEntity({
    required this.itemID,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.restaurantName,
    required this.restaurantID,
    required this.imageUrl,
  });

  final int itemID;
  final String itemName;
  final String itemDescription;
  final int itemPrice;
  final String restaurantName;
  final int restaurantID;
  final String imageUrl;

  @override
  List<Object?> get props => [
        itemID,
        itemName,
        itemDescription,
        itemPrice,
        restaurantName,
        restaurantID,
        imageUrl,
      ];

  /// Get category based on item name and description
  MenuCategory get category => _categorizeItem();

  /// Check if item is vegetarian
  bool get isVegetarian => _isVegetarian();

  /// Check if item is spicy
  bool get isSpicy => _isSpicy();

  /// Get formatted price with currency
  String get formattedPrice => '₹$itemPrice';

  /// Get tags for this item
  List<String> get tags => _generateTags();

  /// Search helper - check if item matches query
  bool matchesSearch(String query) {
    final lowerQuery = query.toLowerCase();
    return itemName.toLowerCase().contains(lowerQuery) ||
           itemDescription.toLowerCase().contains(lowerQuery) ||
           restaurantName.toLowerCase().contains(lowerQuery);
  }

  /// Domain-level copy (useful in presentation)
  MenuItemEntity copyWith({
    int? itemID,
    String? itemName,
    String? itemDescription,
    int? itemPrice,
    String? restaurantName,
    int? restaurantID,
    String? imageUrl,
  }) {
    return MenuItemEntity(
      itemID: itemID ?? this.itemID,
      itemName: itemName ?? this.itemName,
      itemDescription: itemDescription ?? this.itemDescription,
      itemPrice: itemPrice ?? this.itemPrice,
      restaurantName: restaurantName ?? this.restaurantName,
      restaurantID: restaurantID ?? this.restaurantID,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  // Private methods for categorization logic
  MenuCategory _categorizeItem() {
    final name = itemName.toLowerCase();
    final description = itemDescription.toLowerCase();

    if (name.contains('biryani') || name.contains('pulav') || name.contains('rice')) {
      return MenuCategory.riceDishes;
    }
    if (name.contains('chicken') || name.contains('mutton') || name.contains('lamb') ||
        name.contains('kebab') || description.contains('meat')) {
      return MenuCategory.nonVeg;
    }
    if (name.contains('dosa') || name.contains('idli') || name.contains('vada') ||
        name.contains('sambar') || description.contains('south indian')) {
      return MenuCategory.southIndian;
    }
    if (name.contains('sweet') || name.contains('dessert') || name.contains('jamun') ||
        name.contains('kulfi') || name.contains('baklava') || description.contains('sweet')) {
      return MenuCategory.desserts;
    }
    if (name.contains('coffee') || name.contains('tea') || name.contains('lassi') ||
        name.contains('juice') || description.contains('drink')) {
      return MenuCategory.beverages;
    }
    if (name.contains('pizza') || name.contains('pasta') || name.contains('burger')) {
      return MenuCategory.continental;
    }
    if (name.contains('thali') || description.contains('complete meal')) {
      return MenuCategory.thalis;
    }
    if (name.contains('samosa') || name.contains('pakora') || name.contains('chaat')) {
      return MenuCategory.snacks;
    }
    if (name.contains('paneer') || name.contains('dal') || description.contains('vegetable')) {
      return MenuCategory.vegetarian;
    }
    return MenuCategory.mainCourse;
  }

  bool _isVegetarian() {
    final name = itemName.toLowerCase();
    final description = itemDescription.toLowerCase();
    
    final nonVegKeywords = ['chicken', 'mutton', 'lamb', 'fish', 'prawn', 'meat', 'egg'];
    
    for (String keyword in nonVegKeywords) {
      if (name.contains(keyword) || description.contains(keyword)) {
        return false;
      }
    }
    return true;
  }

  bool _isSpicy() {
    final name = itemName.toLowerCase();
    final description = itemDescription.toLowerCase();
    
    final spicyKeywords = ['spicy', 'hot', 'chili', 'masala', 'curry', 'tandoori'];
    
    for (String keyword in spicyKeywords) {
      if (name.contains(keyword) || description.contains(keyword)) {
        return true;
      }
    }
    return false;
  }


  List<String> _generateTags() {
    final tags = <String>[];
    
    if (isVegetarian) tags.add('Veg');
    if (isSpicy) tags.add('Spicy');
    if (itemName.toLowerCase().contains('grilled') || 
        itemDescription.toLowerCase().contains('grilled')) {
      tags.add('Grilled');
    }
    if (itemName.toLowerCase().contains('fried') || 
        itemDescription.toLowerCase().contains('fried')) {
      tags.add('Fried');
    }
    if (itemDescription.toLowerCase().contains('creamy')) tags.add('Creamy');
    if (itemDescription.toLowerCase().contains('traditional')) tags.add('Traditional');
    
    return tags;
  }
}
