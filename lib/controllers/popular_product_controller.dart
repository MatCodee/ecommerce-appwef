

import 'package:ecommerce_app/controllers/cart_controller.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/service/repository/popular_products_repo.dart';
import 'package:ecommerce_app/utils/color_custom.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductsList = [];
  List<dynamic> get popularProductsList => _popularProductsList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int _inCartItems = 0;

  int get quantity => _quantity;
  int get inCartItems => _inCartItems + _quantity; 

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductsList = [];
      _popularProductsList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print(response.body);
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantiry(_quantity + 1);
    } else {
      _quantity = checkQuantiry(_quantity - 1);
    }
    update();
  }

  int checkQuantiry(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Item count", "Tu no puedes reducir mas!",
        backgroundColor: AppColors.mainColor,
      );
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
        Get.snackbar("Item count", "Tu no puedes agregar mas!",
        backgroundColor: AppColors.mainColor,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product,CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    // if exist : get cart from sotorage
    var exist = false;
    exist = _cart.existInCart(product);
    print("Exist or no: " + exist.toString());
    if(exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print("the quantity in the cart is: " + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    if(_quantity > 0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _inCartItems = _cart.getQuantity(product);

      _cart.items.forEach((key, value) {
        print("the id is : " + value.id.toString() + " The quantity is: " + value.quantity.toString());
      });
    } else {
      Get.snackbar("Item count", "No puedes agregar 0 elementos al carro!");
    }
  }

  int get totalItems {
    return _cart.totalItems;
  }
  List<CartModel> get getItems {
    return _cart.getItems;
  }

}
