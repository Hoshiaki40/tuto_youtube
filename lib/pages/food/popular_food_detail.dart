import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimesion.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:food_delivery/widgets/big_text.dart';

import 'package:food_delivery/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Current height devices : ${MediaQuery.of(context).size.height}");
    print("Current width devices : ${MediaQuery.of(context).size.width}");
    print("Current list veiw image size  : ${Dimensions.listViewImageSize}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //*Background Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImageSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png"),
                ),
              ),
            ),
          ),
          //* Icon widget
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.arrow_back_outlined),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          //* Introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImageSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(
                    text: "Chinese Side",
                  ),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: lorem(paragraphs: 1, words: 200),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.only(
          left: Dimensions.width10,
          right: Dimensions.width10,
        ),
        margin: EdgeInsets.only(
          bottom: Dimensions.width20,
          left: Dimensions.width20,
          right: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          boxShadow: [
            const BoxShadow(
              color: Color(0xFFe8e8e8),
              blurRadius: 5.0,
              offset: Offset(5, 5),
            ),
            BoxShadow(
              color: AppColors.buttonBackgroundColor,
              offset: const Offset(-5, 0),
            ),
            BoxShadow(
              color: AppColors.buttonBackgroundColor,
              offset: const Offset(5, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.height10),
              decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.circular(Dimensions.radius15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_rounded,
                    color: AppColors.mainColor,
                    size: Dimensions.iconSize36,
                  ),
                  SizedBox(width: Dimensions.width15),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width15),
                  Icon(
                    Icons.add_rounded,
                    color: AppColors.mainColor,
                    size: Dimensions.iconSize36,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height15,
                bottom: Dimensions.height15,
                left: Dimensions.width15,
                right: Dimensions.width15,
              ),
              child: BigText(
                text: "\$10 | add to card",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius15)),
            ),
          ],
        ),
      ),
    );
  }
}
