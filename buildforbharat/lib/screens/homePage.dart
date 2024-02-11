import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/env_provider.dart';
import '../widget/distanceSlider.dart';
import '../widget/productSlider.dart';
import 'envSettings.dart';
class MyHomePage extends StatelessWidget {
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
                          const DistanceSlider(
                              groceryType: "Apple",
                              city: "Gangtok",
                              initialValue: 2.2,
                              maxValue: 5.0,
                              place: "MG Marg",
                              householdRate: 10805
                          ),
                          ProductSlider(
                              groceryType: "Apple",
                              initialValue: 230+(10*provider.appleDistance/gangtokHouseholdRate),
                              maxValue: appleMaxRate,
                              buyerNumbers:
                                  provider.appleDistance == 0.0 ? initailGangtokRadius*gangtokHouseholdRate : provider.appleDistance,
                              unit: unit,
                              householdRate: gangtokHouseholdRate
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const DistanceSlider(
                              groceryType: "Banana",
                              city: "Gangtok",
                              initialValue: 2.2,
                              maxValue: 5.0,
                              place: "MG Marg",
                              householdRate: 10805
                          ),
                          ProductSlider(
                              groceryType: "Banana",
                              initialValue: 60+(10*provider.bananaDistance/gangtokHouseholdRate),
                              maxValue: 150,
                              buyerNumbers: provider.bananaDistance == 0.0 ? initailGangtokRadius*gangtokHouseholdRate : provider.bananaDistance,
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
                          const DistanceSlider(
                              groceryType: "HairCut",
                              city: "Gangtok",
                              initialValue: 2.2,
                              maxValue: 5.0,
                              place: "MG Marg",
                              householdRate: 10805
                          ),
                          ProductSlider(
                              groceryType: "HairCut",
                              initialValue: 250+(10*provider.hairCutDistance/gangtokHouseholdRate),
                              maxValue: 500,
                              buyerNumbers: provider.hairCutDistance == 0.0 ? initailGangtokRadius*gangtokHouseholdRate : provider.hairCutDistance,
                              unit: "Hair Cut",
                              householdRate: gangtokHouseholdRate
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const DistanceSlider(
                              groceryType: "Spa",
                              city: "Gangtok",
                              initialValue: 2.2,
                              maxValue: 5.0,
                              place: "MG Marg",
                              householdRate: 10805
                          ),
                          ProductSlider(
                              groceryType: "Spa",
                              initialValue: 400+(10*provider.spaDistance/gangtokHouseholdRate),
                              maxValue: 1000,
                              buyerNumbers: provider.spaDistance == 0.0 ? initailGangtokRadius*gangtokHouseholdRate : provider.spaDistance,
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
                          const DistanceSlider(
                              groceryType: "Bread",
                              city: "Gangtok",
                              initialValue: 2.2,
                              maxValue: 5.0,
                              place: "MG Marg",
                              householdRate: 10805
                          ),
                          ProductSlider(
                              groceryType: "Bread",
                              initialValue: 40+(10*provider.breadDistance/gangtokHouseholdRate),
                              maxValue: 150,
                              buyerNumbers: provider.breadDistance == 0.0 ? initailGangtokRadius*gangtokHouseholdRate : provider.breadDistance,
                              unit: "Pkt",
                              householdRate: gangtokHouseholdRate
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const DistanceSlider(
                              groceryType: "Milk",
                              city: "Gangtok",
                              initialValue: 2.2,
                              maxValue: 5.0,
                              place: "MG Marg",
                              householdRate: 10805
                          ),
                          ProductSlider(
                              groceryType: "Milk",
                              initialValue: 30+(10*provider.milkDistance/gangtokHouseholdRate),
                              maxValue: 110,
                              buyerNumbers: provider.milkDistance == 0.0 ? initailGangtokRadius*gangtokHouseholdRate : provider.milkDistance,
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
}