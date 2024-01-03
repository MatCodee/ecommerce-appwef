
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/service/repository/recomended_products_repo.dart';
import 'package:get/get.dart';

class RecomendedProductController extends GetxController {
  final RecomendedProductRepo recomendedProductRepo;

  RecomendedProductController({required this.recomendedProductRepo});

  List<dynamic> _recomendedProductsList = [];
  List<dynamic> get recomendedProductsList => _recomendedProductsList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecomendedProductList() async {
    Response response = await recomendedProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _recomendedProductsList = [];
    
      //_recomendedProductsList.addAll(Product.fromJson(response.body).products);

      dynamic productsData = response.body;
      List<ProductModel> products = List<ProductModel>.from(productsData.map((jsonProduct) => ProductModel.fromJson(jsonProduct)));
      _recomendedProductsList = products;


      //_recomendedProductsList = products;
      _isLoaded = true;
      update();
    } else {
      print(response.body);
    }
  }
}