import 'package:flutter/cupertino.dart';

class BuyerProvider with ChangeNotifier{
  double distance = 0.0;
  double assignedPrice = 0.0;

  void setDistance(double selecteDistance){
    distance = selecteDistance;
    notifyListeners();
  }
  void setPrice(double price){
    assignedPrice = price;
    notifyListeners();
    debugPrint(assignedPrice.toStringAsFixed(2));
  }
}