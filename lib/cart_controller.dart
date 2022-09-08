import 'package:card_pratice/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartController extends StateNotifier<List<ProductModel>> {
  CartController() : super([]);

  addProduct(ProductModel productModel) {
    if (state.contains(productModel)) {
      state[state.indexOf(productModel)].quantity += 1;
      state = [...state];
    } else {
      state = [...state..add(productModel)];
    }
  }

  removeProduct(ProductModel productModel) {
    state[state.indexOf(productModel)].quantity = 1;
    return state = [...state..remove(productModel)];
  }

  void quanity(ProductModel productModel, String type) {
    if (type == "increament") {
      state[state.indexOf(productModel)].quantity += 1;
      state = [...state];
    } else {
      state[state.indexOf(productModel)].quantity -= 1;
      state = [...state];
    }
  }

  double getTotalPrice() {
    double totalPrice = 0.0;

    for (int i = 0; i < state.length; i++) {
      totalPrice = totalPrice + state[i].getTotalPrice();
    }
    return totalPrice;
  }
}

final cartControllerProvider =
    StateNotifierProvider<CartController, List<ProductModel>>((ref) {
  return CartController();
});
