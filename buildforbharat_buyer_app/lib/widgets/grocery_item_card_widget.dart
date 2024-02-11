import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../common_widgets/app_text.dart';
import '../models/grocery_item.dart';
import '../styles/colors.dart';

class GroceryItemCardWidget extends StatelessWidget {
  GroceryItemCardWidget({
    Key? key,
    required this.item,
    this.heroSuffix,
    required this.recommendApplePrice,
    required this.recommendBananaPrice,
    required this.recommendHairCutPrice,
    required this.recommendSpaPrice,
    required this.recommendMilkPrice,
    required this.recommendBreadPrice,
  })
      : super(key: key);
  final GroceryItem item;
  final String recommendApplePrice;
  final String recommendBananaPrice;
  final String recommendHairCutPrice;
  final String recommendSpaPrice;
  final String recommendMilkPrice;
  final String recommendBreadPrice;
  final String? heroSuffix;

  final double width = 174;
  final double height = 250;
  final Color borderColor = const Color(0xffE2E2E2);
  final double borderRadius = 18;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: "GroceryItem:" + item.name + "-" + (heroSuffix ?? ""),
                  child: imageWidget(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AppText(
              text: item.name,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              text: item.description,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF7C7C7C),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                AppText(
                  text: item.name == "Kashmiri Apple"?
                  "₹${recommendApplePrice}":
                  item.name == "Organic Bananas"?
                  "₹${recommendBananaPrice}":
                  item.name == "Hair Saloon"?
                  "₹${recommendHairCutPrice}":
                  item.name == "Spa and Beauty"?
                  "₹${recommendSpaPrice}":
                  item.name == "Brown Bread"?
                  "₹${recommendBreadPrice}":
                  "₹${recommendMilkPrice}"
                  ,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                addWidget()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Container(
      child: Image.asset(item.imagePath),
    );
  }

  Widget addWidget() {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: AppColors.primaryColor),
      child: Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
