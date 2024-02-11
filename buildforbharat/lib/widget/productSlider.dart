import 'package:buildforbharat/provider/env_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ProductSlider extends StatelessWidget {
  final String groceryType;
  final double initialValue;
  final double maxValue;
  final double buyerNumbers;
  final String unit;
  final double householdRate;

  const ProductSlider({super.key, required this.initialValue, required this.maxValue, required this.groceryType, required this.buyerNumbers, required this.unit, required this.householdRate });

  @override
  Widget build(BuildContext context) {
    double price = 0;
    price  = Provider.of<EnvProvider>(context, listen: false).itemPrice;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SleekCircularSlider(
          initialValue: initialValue,
          max: maxValue,
          appearance: CircularSliderAppearance(
            customColors: CustomSliderColors(
              progressBarColors: [Colors.white, Colors.white, Colors.blueGrey, ], // Customize progress bar colors
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
            angleRange: 240,
            infoProperties: InfoProperties(
              topLabelText: "",//"Avg price of ${widget.groceryType}/${widget.unit}\nwith ${widget.buyerNumbers} number of buyers \n within 10km radius",
              topLabelStyle: const TextStyle(fontSize: 12, color: Colors.green),
              mainLabelStyle: const TextStyle(fontSize: 24, color: Colors.blue),
              modifier: (double value) {
                // price = value;
                return '\n ₹${value.toStringAsFixed(2)}';
              },
            ),
            spinnerMode: false,
            animationEnabled: true,
          ),
          // onChange: null,
          // onChange: (double value) {
          //   debugPrint(groceryType);
          // },
        ),
        Positioned(
          top: height*0.035,
          left: width*0.17,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              groceryType,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: height*0.065,
          left: width*0.08,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Average price per ${unit}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: height*0.08,
          left: width*0.08,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "With ${buyerNumbers.toStringAsFixed(0)} searchers",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: height*0.1,
          left: width*0.08,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Within ${(buyerNumbers/householdRate).toStringAsFixed(1)}Kms radius",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
