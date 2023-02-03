import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/utils/color_custom.dart';
import 'package:ecommerce_app/utils/dinemsion_page.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/icon_and_text_widget.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimension.pageViewContainer;


  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        print("Current value is " + _currPageValue.toString());
      });
    }); 
  }

  @override
  void dispose() {
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider Section
        Container(
          //color: Colors.amber,
          height: Dimension.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context,index) {
              return _buildPageItem(index);
            },
          ),
        ),
        // Dots
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        // Popular Text
        SizedBox(height: Dimension.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimension.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".",color: Colors.black26,),
              ),
              SizedBox(width: Dimension.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child:  SmallText(text: "Food Pairing"),
              ),
            ],
          ),
        ),

        Container(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context,index) {
              return Container(
                margin: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius20),
                        color: Colors.white38,
                        image: const DecorationImage(
                          image: AssetImage("assets/imagen.png"),
                        ),
                      ),
                    )
                  ],
                ),
              );
          }),
        )
      ],
    );
  }


  Matrix4 transform_card(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height* (1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans, 0);
    }else if(index == _currPageValue.floor()+1) {
      var currScale = _scaleFactor + (_currPageValue - index +1)*(1-_scaleFactor);
      var currTrans = _height* (1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans, 0);
    }else if(index == _currPageValue.floor()-1) {
      var currScale = 1 - (_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height* (1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,currTrans, 0);
    }else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0,_height*(1-_scaleFactor)/2, 1);
    }
    return matrix;
  }

  Widget _buildPageItem(int index) {
    return Transform(
      transform: transform_card(index),
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: Dimension.width10,right: Dimension.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? const Color(0xFF69C5DF) : const Color(0xFF9294CC),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/imagen.png"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimension.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimension.width30,right: Dimension.width30,bottom: Dimension.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                ]
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 15,left: Dimension.width20,right: Dimension.width20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Side"),
                    SizedBox(height: Dimension.height10,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => const Icon((Icons.star),color: AppColors.mainColor,size: 15,)),
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: "4.5"),
                        SizedBox(width: 10,),
                        SmallText(text: "1287"),
                        SizedBox(width: 10,),
                        SmallText(text: "comments"),
    
                      ],
                    ),
                    SizedBox(height: Dimension.height20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(icon: Icons.circle_sharp, iconColor: AppColors.iconColor1, text: "normal"),
                        IconAndTextWidget(icon: Icons.location_on, iconColor: AppColors.mainColor, text: "1.7km"),
                        IconAndTextWidget(icon: Icons.access_time_filled_rounded, iconColor: AppColors.iconColor2, text: "32min"),
                      ],
                    )
                  ],
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}