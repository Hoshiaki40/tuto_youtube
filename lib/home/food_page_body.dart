<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimetion.dart';
import 'package:food_delivery/widgets/Icon_and_text_widget.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  double height = Dimentions.height220;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Current height  of device : ${MediaQuery.of(context).size.height}");
    return Column(
      children: [
        //slider
        Container(
          //color: Colors.red.shade600,
          height: Dimentions.height320,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        //dots
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          onTap: (index) {
            setState(() {
              _currentPageValue = index;
            });
          },
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //popular text
        SizedBox(height: Dimentions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimentions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimentions.width10),
              Container(
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimentions.width10),
              Container(
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index > _currentPageValue.floor()) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index < _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimentions.height220,
            margin: EdgeInsets.only(
              left: Dimentions.width10,
              right: Dimentions.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimentions.radius30,
              ),
              color: (index % 2 == 0)
                  ? const Color(0xFF63c5df)
                  : const Color(0xFFfa7552),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food0.png"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimentions.height15,
                  left: Dimentions.width15,
                  right: Dimentions.width15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Side"),
                    SizedBox(height: Dimentions.height10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15,
                            ),
                          ),
                        ),
                        SizedBox(width: Dimentions.width10),
                        SmallText(text: "4.5"),
                        SizedBox(width: Dimentions.width10),
                        SmallText(text: "1287"),
                        SizedBox(width: Dimentions.width10),
                        SmallText(text: "comments"),
                      ],
                    ),
                    SizedBox(height: Dimentions.height20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: AppColors.iconColor1),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "1.7km",
                            iconColor: AppColors.mainColor),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "Normal",
                            iconColor: AppColors.iconColor2),
                      ],
                    )
                  ],
                ),
              ),
              height: Dimentions.height120,
              margin: EdgeInsets.only(
                left: Dimentions.width30,
                right: Dimentions.width30,
                bottom: Dimentions.height30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius20),
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
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
=======

>>>>>>> d261349c2075f41367ff1b61e7a8acce050e71d7
