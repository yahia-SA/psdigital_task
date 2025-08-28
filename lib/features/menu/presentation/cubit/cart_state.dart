part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState(this.quantities, this.favorites,this.prices);
  
  final Map<int, int> quantities;
  final Map<int, bool> favorites;
  final Map<int, int> prices;

  @override
  List<Object?> get props => [quantities, favorites, prices];
}
