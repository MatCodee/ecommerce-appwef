import 'package:ecommerce_app/controllers/cart_controller.dart';
import 'package:ecommerce_app/controllers/popular_product_controller.dart';
import 'package:ecommerce_app/pages/cart/cart_page.dart';
import 'package:ecommerce_app/pages/home/main_food_page.dart';
import 'package:ecommerce_app/routes/routers_helpers.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:ecommerce_app/utils/color_custom.dart';
import 'package:ecommerce_app/utils/dinemsion_page.dart';
import 'package:ecommerce_app/widgets/app_icon.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/exandable_text.dart';
import 'package:ecommerce_app/widgets/icon_and_text_widget.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductsList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    print("Page is id: " + pageId.toString());
    print("product name is " + product.name.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimension.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppContants.BASE_URL + "/uploads/" + product.img!)
                )
              ),
            )
          ),
          // Icon Widget
          Positioned(
            top: Dimension.height45,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const  MainFoodPage());
                  },
                  child: const AppIcon(icon: Icons.arrow_back_ios)
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouterHelper.getCartPage());
                  },
                  child: const AppIcon(icon: Icons.shopping_cart_outlined)
                ),
              ],
            ),
          ),
          // Introduction of food
          Positioned(
            left: 0,
            right: 0,
            top: Dimension.popularFoodImgSize-20,
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimension.height20,
                  left: Dimension.width20,
                  right: Dimension.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimension.radius20),
                  topLeft: Radius.circular(Dimension.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: product.name),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => const Icon(
                                  (Icons.star),
                                  color: AppColors.mainColor,
                                  size: 15,
                                )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "4.5"),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "1287"),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "comments"),
                    ],
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          iconColor: AppColors.iconColor1,
                          text: "normal"),
                      IconAndTextWidget(
                          icon: Icons.location_on,
                          iconColor: AppColors.mainColor,
                          text: product.location),
                      IconAndTextWidget(
                          icon: Icons.access_time_filled_rounded,
                          iconColor: AppColors.iconColor2,
                          text: "32min"),
                    ],
                  ),
                  SizedBox(height: Dimension.height20,),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimension.height10,),
                  SingleChildScrollView(
                    child: ExandableTextWidget(text: product.description)
                  ),
                ],
              ),
            ),
          ),
          // Expandable text widget

        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
        height: 130,
        padding: EdgeInsets.only(
          top: Dimension.height30,
          bottom: Dimension.height30,
          left: Dimension.width20,
          right: Dimension.width20
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimension.radius20),
            topRight: Radius.circular(Dimension.radius20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimension.height20,
                bottom: Dimension.height20,
                left: Dimension.width20, 
                right: Dimension.width20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(false);
                    },
                    child: const Icon(Icons.remove, color: AppColors.signColor),
                  ),
                  SizedBox(width: Dimension.width10/2,),
                  BigText(text: popularProduct.inCartItems.toString()), 
                  SizedBox(width: Dimension.width10/2,),
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(true);
                    },
                    child: const Icon(Icons.add,color: AppColors.signColor),
                  ),                  
                ]
                ,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimension.height20,
                bottom: Dimension.height20,
                left: Dimension.width20, 
                right: Dimension.width20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: BigText(text: "\$ ${product.price} Add to Cart",color: Colors.white,)
                ),
              ),
            ),
          ],
        ),
      );
      }
      )
      
    );
  }
}
