enum MenuCategory {
  all,
  riceDishes,
  nonVeg,
  vegetarian,
  southIndian,
  desserts,
  beverages,
  continental,
  thalis,
  snacks,
  mainCourse;

  String get displayName {
    switch (this) {
      case MenuCategory.all:
        return 'All';
      case MenuCategory.riceDishes:
        return 'Rice Dishes';
      case MenuCategory.nonVeg:
        return 'Non-Veg';
      case MenuCategory.vegetarian:
        return 'Vegetarian';
      case MenuCategory.southIndian:
        return 'South Indian';
      case MenuCategory.desserts:
        return 'Desserts';
      case MenuCategory.beverages:
        return 'Beverages';
      case MenuCategory.continental:
        return 'Continental';
      case MenuCategory.thalis:
        return 'Thalis';
      case MenuCategory.snacks:
        return 'Snacks';
      case MenuCategory.mainCourse:
        return 'Main Course';
    }
  }

  String get icon {
    switch (this) {
      case MenuCategory.all:
        return '📋';
      case MenuCategory.riceDishes:
        return '🍚';
      case MenuCategory.nonVeg:
        return '🍖';
      case MenuCategory.vegetarian:
        return '🥬';
      case MenuCategory.southIndian:
        return '🥞';
      case MenuCategory.desserts:
        return '🍰';
      case MenuCategory.beverages:
        return '☕';
      case MenuCategory.continental:
        return '🍕';
      case MenuCategory.thalis:
        return '🍱';
      case MenuCategory.snacks:
        return '🍿';
      case MenuCategory.mainCourse:
        return '🍽️';
    }
  }
}
