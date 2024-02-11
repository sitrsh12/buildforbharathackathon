import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/grocery_item.dart';
import '../../styles/colors.dart';
import '../../widgets/grocery_item_card_widget.dart';
import '../../widgets/search_bar_widget.dart';
import '../product_details/product_details_screen.dart';
import 'grocery_featured_Item_widget.dart';
import 'home_banner_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    readAppleData();
    readBananaData();
    readHairCutData();
    readSpaData();
    readMilkData();
    readBreadData();
    super.initState();
  }

  String recommendApplePrice = "0.0";
  void readAppleData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NptwFUvf3JFNT_PaxSV");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      recommendApplePrice = values["recommendBuyPrice"].toString();
      setState(() {});
    });
  }

  String recommendBananaPrice = "0.0";
  void readBananaData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NpywQutLP57oatKEabR");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      recommendBananaPrice = values["recommendBuyPrice"].toString();
      setState(() {});
    });
  }

  String recommendHairCutPrice = "0.0";
  void readHairCutData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NpywRW4RETlI9Zqn_in");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      recommendHairCutPrice = values["recommendBuyPrice"].toString();
      setState(() {});
    });
  }

  String recommendSpaPrice = "0.0";
  void readSpaData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NpywRzo-GNWrhlGSCL1");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      recommendSpaPrice = values["recommendBuyPrice"].toString();
      setState(() {});
    });
  }

  String recommendMilkPrice = "0.0";
  void readMilkData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NpywSieF6mGK7u3ZOT3");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      recommendMilkPrice = values["recommendBuyPrice"].toString();
      setState(() {});
    });
  }

  String recommendBreadPrice = "0.0";
  void readBreadData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NpywSMHcSLrVg5WodQh");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      recommendBreadPrice = values["recommendBuyPrice"].toString();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/images/buildforbharat.png", height: 100,),
                  padded(locationWidget()),
                  SizedBox(
                    height: 15,
                  ),
                  padded(SearchBarWidget()),
                  SizedBox(
                    height: 25,
                  ),
                  padded(HomeBanner()),
                  const SizedBox(
                    height: 25,
                  ),
                  padded(subTitle("Fresh Fruits")),
                  getHorizontalItemSlider(groceryItems),
                  SizedBox(
                    height: 15,
                  ),
                  padded(subTitle("Best Services")),
                  getHorizontalItemSlider(bestServices),
                  SizedBox(
                    height: 15,
                  ),
                  padded(subTitle("Groceries")),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 105,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        GroceryFeaturedCard(
                          groceryFeaturedItems[0],
                          color: Color(0xffF8A44C),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GroceryFeaturedCard(
                          groceryFeaturedItems[1],
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  getHorizontalItemSlider(groceries),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget padded(Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: widget,
    );
  }

  Widget getHorizontalItemSlider(List<GroceryItem> items) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 250,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onItemClicked(context, items[index]);
            },
            child: GroceryItemCardWidget(
              recommendApplePrice: recommendApplePrice,
              recommendBananaPrice: recommendBananaPrice,
              recommendHairCutPrice: recommendHairCutPrice,
              recommendSpaPrice: recommendSpaPrice,
              recommendMilkPrice: recommendMilkPrice,
              recommendBreadPrice: recommendBreadPrice,
              item: items[index],
              heroSuffix: "home_screen",
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  void onItemClicked(BuildContext context, GroceryItem groceryItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
            recommendApplePrice: recommendApplePrice,
            recommendBananaPrice: recommendBananaPrice,
            recommendHairCutPrice: recommendHairCutPrice,
            recommendSpaPrice: recommendSpaPrice,
            recommendMilkPrice: recommendMilkPrice,
            recommendBreadPrice: recommendBreadPrice,
                groceryItem,
                heroSuffix: "home_screen",
              )),
    );
  }

  Widget subTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Text(
          "See All",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
      ],
    );
  }

  Widget locationWidget() {
    String locationIconPath = "assets/icons/location_icon.svg";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          locationIconPath,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "Gangtok, MG Marg",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
