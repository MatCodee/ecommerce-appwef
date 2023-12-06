import 'package:ecommerce_app/controllers/cart_controller.dart';
import 'package:ecommerce_app/routes/routers_helpers.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:ecommerce_app/utils/color_custom.dart';
import 'package:ecommerce_app/utils/dinemsion_page.dart';
import 'package:ecommerce_app/widgets/app_icon.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimension.height20 * 3,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouterHelper.getInitial());
                  },
                  child: const AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                ),
                SizedBox(
                  width: Dimension.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    print("Entrando al Home");
                  },
                  child: const AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                ),
                const AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimension.height20 * 5,
            left: Dimension.width20,
            right: Dimension.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimension.height15),
              //color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController) {
                  var cartList = cartController.getItems;
                  return ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (_, index) {
                      return Container(
                        width: double.maxFinite,
                        height: Dimension.height20 * 5,
                        margin: EdgeInsets.only(bottom: Dimension.height10),
                        child: Row(
                          children: [
                            Container(
                              width: Dimension.width20 * 5,
                              height: Dimension.height20 * 5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    //image: AssetImage("assets/imagen.png")),
                                    image: NetworkImage(AppContants.BASE_URL + '/uploads/' + cartList[index].img!),
                                ),
                                borderRadius: BorderRadius.circular(Dimension.radius20),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: Dimension.width10),
                            Expanded(
                              child: Container(
                                height: Dimension.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(
                                      text: cartController.getItems[index].name,
                                      color: Colors.black54,
                                    ),
                                    SmallText(text: "Spicy"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                          text: '\$ ' + cartList[index].price.toString(),
                                          color: Colors.redAccent,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: Dimension.height10,
                                              bottom: Dimension.height10,
                                              left: Dimension.width20,
                                              right: Dimension.width20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimension.radius20),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  cartController.addItem(cartList[index].product!, -1);
                                                },
                                                child: const Icon(Icons.remove,
                                                    color: AppColors.signColor),
                                              ),
                                              SizedBox(
                                                width: Dimension.width10 / 2,
                                              ),
                                              BigText(
                                                text: cartList[index].quantity.toString(),
                                              ),
                                              SizedBox(
                                                width: Dimension.width10 / 2,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  cartController.addItem(cartList[index].product!, 1);
                                                },
                                                child: const Icon(Icons.add,
                                                    color: AppColors.signColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                );
                }
                ),

              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (cartController) {
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
                  BigText(text: '\$ ' + cartController.totalAmount.toString()), 
                ]
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
                    //popularProduct.addItem(product);
                  },
                  child: BigText(text: "\$ Check",color: Colors.white,)
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
