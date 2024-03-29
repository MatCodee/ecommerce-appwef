import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;  

  void addItem(ProductModel product, int quantity) {
    if(_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
    } else {
      // Esta funcion va detectando si las claves coinsiden o no coinsiden
      _items.putIfAbsent(product.id!, () {
        //_items.forEach((key, value) {});
        return CartModel(
          id: product.id,
          name: product.name,
          price: product.price,
          img: product.img,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
    }

    update();
  }

  bool existInCart(ProductModel product) {
    if(_items.containsKey(product.id!)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product){ 
    var quantity = 0;
    if(_items.containsKey(product.id!)) {
      _items.forEach((key, value) {
        if (key == product.id!) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity+=value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

}
