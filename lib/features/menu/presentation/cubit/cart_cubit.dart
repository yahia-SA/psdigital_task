import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState({}, {}, {}));

  void addItem(int itemId, int price, {int quantity = 1}) {
    final updatedQuantities = Map<int, int>.from(state.quantities);
    final updatedPrices = Map<int, int>.from(state.prices);

    updatedQuantities[itemId] = (updatedQuantities[itemId] ?? 0) + quantity;
    updatedPrices[itemId] = price;

    emit(CartState(updatedQuantities, state.favorites, updatedPrices));
  }

  // تحديث كمية العنصر
  void updateQuantity(int itemId, int quantity) {
    final updatedQuantities = Map<int, int>.from(state.quantities);
    
    if (quantity <= 0) {
      updatedQuantities.remove(itemId);
    } else {
      updatedQuantities[itemId] = quantity;
    }
    
    emit(CartState(updatedQuantities, state.favorites, state.prices));
  }

  // زيادة الكمية
  void incrementQuantity(int itemId) {
    final currentQuantity = state.quantities[itemId] ?? 0;
    updateQuantity(itemId, currentQuantity + 1);
  }

  // تقليل الكمية
  void decrementQuantity(int itemId) {
    final currentQuantity = state.quantities[itemId] ?? 0;
    if (currentQuantity > 0) {
      updateQuantity(itemId, currentQuantity - 1);
    }
  }

  // تبديل حالة المفضلة
  void toggleFavorite(int itemId) {
    final updatedFavorites = Map<int, bool>.from(state.favorites);
    updatedFavorites[itemId] = !(state.favorites[itemId] ?? false);
    emit(CartState(state.quantities, updatedFavorites, state.prices));
  }

  // الحصول على كمية عنصر معين
  int getQuantity(int itemId) {
    return state.quantities[itemId] ?? 0;
  }

  // التحقق من حالة المفضلة
  bool isFavorite(int itemId) {
    return state.favorites[itemId] ?? false;
  }

  // إجمالي عدد العناصر في السلة
  int get totalItems {
    return state.quantities.values.fold(0, (sum, quantity) => sum + quantity);
  }

  // إجمالي عدد المفضلة
  int get favoriteItemsCount {
    return state.favorites.values.where((isFav) => isFav).length;
  }
  // total prices
  int get totalPrice {
  int total = 0;
  state.quantities.forEach((itemId, quantity) {
    final price = state.prices[itemId] ?? 0;
    total += price * quantity;
  });
  return total;
}

}
