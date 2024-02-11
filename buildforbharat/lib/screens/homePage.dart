import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/env_provider.dart';
import '../widget/distanceSlider.dart';
import '../widget/productSlider.dart';
import 'envSettings.dart';
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String city = "Gangtok";
  String place = "MG MARG";
  String unit = "Kg";
  double gangtokHouseholdRate = 10805;
  double initailGangtokRadius = 2.2;
  double maxGangtokRadius = 5.0;
  double appleCurrentRate = 230;
  double appleMaxRate = 280;
  double? envTotalValue = 0;

  getEnvValue()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    envTotalValue = sharedPreferences.getDouble("envTotalValue");
  }

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Center(child: Text('Build For Bharat Hackathon\n Envornment Setup', textAlign: TextAlign.center,)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return EnvSetup();
          }));
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.black12,
        child: const Icon(Icons.settings, size: 60,),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: ChangeNotifierProvider<EnvProvider>(
              create: (context) => EnvProvider(),
              child: Consumer<EnvProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: [
                      const SizedBox(height: 20,),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, bottom: 20),
                        child: Text("Fresh Fruits", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DistanceSlider(
                              groceryType: "Apple",
                              city: "Gangtok",
                              initialValue: double.parse(buyerAppleCount)/10805,
                              maxValue: 5.0,
                              place: "MG Marg",
                              householdRate: 10805
                          ),
                          ProductSlider(
                              groceryType: "Apple",
                              initialValue: 230+(10*double.parse(buyerAppleCount)/10805),
                              maxValue: appleMaxRate,
                              buyerNumbers: double.parse(buyerAppleCount),
                              unit: unit,
                              householdRate: 10805
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DistanceSlider(
                              groceryType: "Banana",
                              city: "Gangtok",
                              initialValue: double.parse(buyerBananaCount)/10805,
                              maxValue: 5.0,
                              place: "MG Marg",
                              householdRate: 10805
                          ),
                          ProductSlider(
                              groceryType: "Banana",
                              initialValue: 60+(10*double.parse(buyerBananaCount)/10805),
                              maxValue: 150,
                              buyerNumbers: double.parse(buyerBananaCount),
                              unit: "12 Pc",
                              householdRate: gangtokHouseholdRate
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, bottom: 20),
                        child: Text("Best Services", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DistanceSlider(
                              groceryType: "HairCut",
                              city: "Gangtok",
                              initialValue: double.parse(buyerHairCutCount)/10805,
                              maxValue: 5.0,
                              place: "MG Marg",
                              householdRate: 10805
                          ),
                          ProductSlider(
                              groceryType: "HairCut",
                              initialValue: 250+(10*double.parse(buyerHairCutCount)/10805),
                              maxValue: 500,
                              buyerNumbers: double.parse(buyerHairCutCount),
                              unit: "Hair Cut",
                              householdRate: gangtokHouseholdRate
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DistanceSlider(
                              groceryType: "Spa",
                              city: "Gangtok",
                              initialValue: double.parse(buyerSpaCount)/10805,
                              maxValue: 5.0,
                              place: "MG Marg",
                              householdRate: 10805
                          ),
                          ProductSlider(
                              groceryType: "Spa",
                              initialValue: 400+(10*double.parse(buyerSpaCount)/10805),
                              maxValue: 1000,
                              buyerNumbers: double.parse(buyerSpaCount),
                              unit: "Spa",
                              householdRate: gangtokHouseholdRate
                          ),

                        ],
                      ),
                      const SizedBox(height: 20,),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, bottom: 20),
                        child: Text("Groceries", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DistanceSlider(
                              groceryType: "Bread",
                              city: "Gangtok",
                              initialValue: double.parse(buyerBreadCount)/10805,
                              maxValue: 5.0,
                              place: "MG Marg",
                              householdRate: 10805
                          ),
                          ProductSlider(
                              groceryType: "Bread",
                              initialValue: 40+(10*double.parse(buyerBreadCount)/10805),
                              maxValue: 150,
                              buyerNumbers: double.parse(buyerBreadCount),
                              unit: "Pkt",
                              householdRate: gangtokHouseholdRate
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DistanceSlider(
                              groceryType: "Milk",
                              city: "Gangtok",
                              initialValue: double.parse(buyerMilkCount)/10805,
                              maxValue: 5.0,
                              place: "MG Marg",
                              householdRate: 10805
                          ),
                          ProductSlider(
                              groceryType: "Milk",
                              initialValue: 30+(10*double.parse(buyerMilkCount)/10805),
                              maxValue: 110,
                              buyerNumbers: double.parse(buyerMilkCount),
                              unit: "Spa",
                              householdRate: gangtokHouseholdRate
                          ),

                        ],
                      ),
                    ],
                  );
                },
              ),
            )
        ),
      ),
    );
  }
  String buyerAppleCount = "0.0";
  void readAppleData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NptwFUvf3JFNT_PaxSV");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      buyerAppleCount = values["distance"].toString();
      setState(() {});
    });
  }


  String buyerBananaCount = "0";
  void readBananaData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NpywQutLP57oatKEabR");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      buyerBananaCount = values["distance"].toString();
      setState(() {});
    });
  }

  String buyerBreadCount = "0";
  void readBreadData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NpywSMHcSLrVg5WodQh");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      buyerBreadCount = values["distance"].toString();
      setState(() {});
    });
  }

  String buyerHairCutCount = "0";
  void readHairCutData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NpywRW4RETlI9Zqn_in");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      buyerHairCutCount = values["distance"].toString();
      setState(() {});
    });
  }

  String buyerMilkCount = "0";
  void readMilkData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NpywSieF6mGK7u3ZOT3");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      buyerMilkCount = values["distance"].toString();
      setState(() {});
    });
  }

  String buyerSpaCount = "0";
  void readSpaData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NpywRzo-GNWrhlGSCL1");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      buyerSpaCount = values["distance"].toString();
      setState(() {});
    });
  }
}