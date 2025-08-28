import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:psdigital_task/features/menu/domain/entities/menu_category.dart';
import 'package:psdigital_task/features/menu/domain/entities/menu_item_entity.dart';
import 'package:psdigital_task/features/menu/domain/usecases/menu_usecase.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit({required this.menuUsecase}) : super(MenuInitial());
  final MenuUsecase menuUsecase;

  Future<void> getMenus() async {
    emit(MenuLoading());
    try {
      final items = await menuUsecase();
      emit(MenuLoaded(
        allItems: items,
        selectedCategory: MenuCategory.all,
        filteredItems: items, // start with all
      ));
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }

  void changeCategory(MenuCategory category) {
    if (state is MenuLoaded) {
      final currentState = state as MenuLoaded;

      List<MenuItemEntity> filtered;
      
      if (category == MenuCategory.all) {
        filtered = List.from(currentState.allItems); // Create a new list
      } else {
        filtered = currentState.allItems
            .where((item) => item.category == category)
            .toList();
      }

      emit(currentState.copyWith(
        selectedCategory: category,
        filteredItems: filtered,
      ));
    }
  }
}
