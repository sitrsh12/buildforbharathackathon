import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class EnvProvider with ChangeNotifier{
  double productRefDistance = 0.0;
  double appleDistance = 0.0;
  double bananaDistance = 0.0;
  double hairCutDistance = 0.0;
  double spaDistance = 0.0;
  double breadDistance = 0.0;
  double milkDistance = 0.0;
  String name = "";
  double itemPrice = 0.0;
  DatabaseReference databaseReference =
  FirebaseDatabase.instance.reference().child('grocery');
  void setAppleHouseholdRate(double selectDistance, double price){
    name = "Apple";
    appleDistance = selectDistance;
    itemPrice = price;
    notifyListeners();
    updateRecord(name, price);
  }
  void setBananaHouseholdRate(double selectDistance, double price){
    name = "Banana";
    bananaDistance = selectDistance;
    itemPrice = price;
    notifyListeners();
    updateRecord(name, price);
  }
  void setHairCutHouseholdRate(double selectDistance, double price){
    name = "HairCut";
    hairCutDistance = selectDistance;
    itemPrice = price;
    notifyListeners();
    updateRecord(name, price);
  }
  void setSpaHouseholdRate(double selectDistance, double price){
    name = "Spa";
    spaDistance = selectDistance;
    itemPrice = price;
    notifyListeners();
    updateRecord(name, price);
  }
  void setBrownBreadHouseholdRate(double selectDistance, double price){
    name = "Bread";
    breadDistance = selectDistance;
    itemPrice = price;
    notifyListeners();
    updateRecord(name, price);
  }
  void setCowMilkHouseholdRate(double selectDistance, double price){
    name = "Milk";
    milkDistance = selectDistance;
    itemPrice = price;
    notifyListeners();
    updateRecord(name, price);
  }
  // setPrice(double price){
  //   itemPrice = price;
  //   notifyListeners();
  //   debugPrint(price.toString());
  //   updateRecord(name, itemPrice);
  // }

  updateRecord(String theName, double price) {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.reference().child('grocery');
    if(theName == "Apple"){
      databaseReference.child('-NptwFUvf3JFNT_PaxSV').update({
        'name': 'Apple',
        'distance': appleDistance.toStringAsFixed(0),
        'assignedPrice': price.toStringAsFixed(0),
      });
    }else if(theName == "Banana"){
      databaseReference.child('-NpywQutLP57oatKEabR').update({
        'name': 'Banana',
        'distance': bananaDistance.toStringAsFixed(0),
        'assignedPrice': price.toStringAsFixed(0),
      });
    }else if(theName == "HairCut"){
      databaseReference.child('-NpywRW4RETlI9Zqn_in').update({
        'name': 'HairCut',
        'distance': hairCutDistance.toStringAsFixed(0),
        'assignedPrice': price.toStringAsFixed(0),
      });
    }else if(theName == "Spa"){
      databaseReference.child('-NpywRzo-GNWrhlGSCL1').update({
        'name': 'Spa',
        'distance': spaDistance.toStringAsFixed(0),
        'assignedPrice': price.toStringAsFixed(0),
      });
    }else if(theName == "Bread"){
      databaseReference.child('-NpywSMHcSLrVg5WodQh').update({
        'name': 'Bread',
        'distance': breadDistance.toStringAsFixed(0),
        'assignedPrice': price.toStringAsFixed(0),
      });
    }else if(theName == "Milk"){
      databaseReference.child('-NpywSieF6mGK7u3ZOT3').update({
        'name': 'Milk',
        'distance': milkDistance.toStringAsFixed(0),
        'assignedPrice': price.toStringAsFixed(0),
      });
    }


    // databaseReference.push().set({
    //   'name': 'apple',
    //   'distance': distance.toStringAsFixed(0),
    //   'assignedPrice': assignedPrice.toStringAsFixed(0),
    // });
  }
}

