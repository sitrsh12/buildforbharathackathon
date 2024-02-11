import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../provider/env_provider.dart';

class DistanceSlider extends StatelessWidget {
  final String groceryType;
  final String city;
  final double initialValue;
  final double maxValue;
  final String place;
  final double householdRate;
  const DistanceSlider({super.key, required this.initialValue, required this.maxValue, required this.city, required this.place, required this.householdRate, required this.groceryType });

  // @override
  // void initState() {
  //   getEnvValue().then((val)=>envTotalValue=val);
  //   super.initState();
  // }
  // double? envTotalValue = 0;
  //
  // Future<double?> getEnvValue()async{
  //   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   envTotalValue = sharedPreferences.getDouble("envTotalValue");
  //   return envTotalValue;
  // }
  double _getRadius(){
    return initialValue*householdRate;
  }

  @override
  Widget build(BuildContext context) {
    final buyerProvider = Provider.of<EnvProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    double distance = 0.0;
    return Stack(
      children: [
        SleekCircularSlider(
          initialValue: initialValue,
          max: maxValue,
          appearance: CircularSliderAppearance(
            angleRange: 240,
            customColors: CustomSliderColors(
              progressBarColors: [Colors.blueGrey, Colors.blueGrey], // Customize progress bar colors
              trackColor: Colors.grey,
              shadowColor: Colors.black,
              shadowMaxOpacity: 1,
            ),
            customWidths: CustomSliderWidths(
              progressBarWidth: 12,
              trackWidth: 12,
              shadowWidth: 5,
            ),
            size: width/2-5,
            startAngle: 150,
            infoProperties: InfoProperties(
              topLabelText: "",//"Avg price of ${widget.groceryType}/${widget.unit}\nwith ${widget.buyerNumbers} number of buyers \n within 10km radius",
              topLabelStyle: const TextStyle(fontSize: 12, color: Colors.green),
              mainLabelStyle: const TextStyle(fontSize: 24, color: Colors.blue),
              modifier: (double value) {
                return '\n ${value.toStringAsFixed(1)} Kms';
              },
            ),
            spinnerMode: false,
            animationEnabled: true,
          ),
          onChange: (double value) {},
          onChangeEnd: (double value){
            // Global.trigger = true;
            // buyerProvider.setHouseholdRate(value*householdRate);
            if(groceryType == "Apple") {
              distance = buyerProvider.appleDistance;
              buyerProvider.setAppleHouseholdRate(value*householdRate, 230+(10*value));//((envTotalValue ?? 0 / 10)*value));
            }else if(groceryType == "Banana"){
              distance = buyerProvider.bananaDistance;
              buyerProvider.setBananaHouseholdRate(value*householdRate, 60+(10*value));//((envTotalValue ?? 0 / 10)*value));
            }else if(groceryType == "HairCut"){
              distance = buyerProvider.hairCutDistance;
              buyerProvider.setHairCutHouseholdRate(value*householdRate, 250+(10*value));//((envTotalValue ?? 0 / 10)*value));
            }else if(groceryType == "Spa"){
              distance = buyerProvider.spaDistance;
              buyerProvider.setSpaHouseholdRate(value*householdRate, 400+(10*value));//((envTotalValue ?? 0 / 10)*value));
            }else if(groceryType == "Bread"){
              distance = buyerProvider.breadDistance;
              buyerProvider.setBrownBreadHouseholdRate(value*householdRate, 40+(10*value));//((envTotalValue ?? 0 / 10)*value));
            }else if(groceryType == "Milk"){
              distance = buyerProvider.milkDistance;
              buyerProvider.setCowMilkHouseholdRate(value*householdRate, 30+(10*value));//((envTotalValue ?? 0 / 10)*value));
              //230+(10*buyerProvider.appleDistance/householdRate)
            }

          },
        ),
        Positioned(
          top: height*0.035,
          left: width*0.14,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              city,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: height*0.065,
          left: width*0.11,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Inside ${place}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: height*0.08,
          left: width*0.065,
          child: Align(
            alignment: Alignment.center,
            child: ChangeNotifierProvider(
            create: (context) => EnvProvider(),
              child: Text(
              "${(distance)==0.0?_getRadius().toStringAsFixed(2):(distance).toStringAsFixed(2)} households",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
            ),
),
          ),
        ),
        Positioned(
          top: height*0.1,
          left: width*0.06,
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "with average 6 members",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
