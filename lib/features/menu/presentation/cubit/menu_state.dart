part of 'menu_cubit.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object?> get props => [];
}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuLoaded extends MenuState {

  const MenuLoaded({
    required this.allItems,
    required this.selectedCategory,
    required this.filteredItems,
  });
  final List<MenuItemEntity> allItems;
  final MenuCategory selectedCategory;
  final List<MenuItemEntity> filteredItems;

  MenuLoaded copyWith({
    List<MenuItemEntity>? allItems,
    MenuCategory? selectedCategory,
    List<MenuItemEntity>? filteredItems,
  }) {
    return MenuLoaded(
      allItems: allItems ?? this.allItems,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      filteredItems: filteredItems ?? this.filteredItems,
    );
  }

  @override
  List<Object?> get props => [allItems, selectedCategory, filteredItems];
}

class MenuError extends MenuState {
  const MenuError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
