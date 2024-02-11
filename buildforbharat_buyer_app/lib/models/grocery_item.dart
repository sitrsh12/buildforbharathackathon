import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class GroceryItem with ChangeNotifier {
  final int? id;
  final String name;
  final String description;
  final double price;
  final String imagePath;

  GroceryItem({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

var demoItems = [
  GroceryItem(
      id: 1,
      name: "Organic Bananas",
      description: "12pcs, Price",
      price: 4.99,
      imagePath: "assets/images/grocery_images/banana.png"),
  GroceryItem(
      id: 2,
      name: "Kashmiri Apple",
      description: "1kg, Price",
      price: 4.99,
      imagePath: "assets/images/grocery_images/apple.png"),
  GroceryItem(
      id: 3,
      name: "Hair Saloon",
      description: "Hair Cut, Price",
      price: 4.99,
      imagePath: "assets/images/hair_saloon.png"),
  GroceryItem(
      id: 4,
      name: "Spa and Beauty",
      description: "Treatment, Price",
      price: 4.99,
      imagePath: "assets/images/spa.png"),
  GroceryItem(
      id: 5,
      name: "Brown Bread",
      description: "250gm, Price",
      price: 4.99,
      imagePath: "assets/images/grocery_images/bread.png"),
  GroceryItem(
      id: 6,
      name: "Diary Milk",
      description: "250ml, Price",
      price: 4.99,
      imagePath: "assets/images/grocery_images/milk.png"),
];

var groceryItems = [demoItems[0], demoItems[1]];

var bestServices = [demoItems[2], demoItems[3]];

var groceries = [demoItems[4], demoItems[5]];