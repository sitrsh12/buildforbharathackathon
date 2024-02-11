import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnvSetup extends StatefulWidget {
  @override
  State<EnvSetup> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<EnvSetup> {

  double _transportSliderValue = 5;
  double _modernFarmingSliderValue = 5;
  double _storageSliderValue = 5;
  double _wasteSliderValue = 5;
  double _seasonSliderValue = 5;
  double _waterSupSliderValue = 5;
  double _productionSliderValue = 5;
  double _weatherSliderValue = 5;
  double _organicSliderValue = 5;
  double _qualitySeedSliderValue = 5;


  @override
  void initState() {
    _getEnv();
    super.initState();
  }
  double envTotal = 0;
  _getEnv() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    double? transportSliderValue = sharedPreferences.getDouble("transportSliderValue");
    double? modernFarmingSliderValue = sharedPreferences.getDouble("modernFarmingSliderValue");
    double? storageSliderValue = sharedPreferences.getDouble("storageSliderValue");
    double? wasteSliderValue = sharedPreferences.getDouble("wasteSliderValue");
    double? seasonSliderValue = sharedPreferences.getDouble("seasonSliderValue");
    double? waterSupSliderValue = sharedPreferences.getDouble("waterSupSliderValue");
    double? productionSliderValue = sharedPreferences.getDouble("productionSliderValue");
    double? weatherSliderValue = sharedPreferences.getDouble("weatherSliderValue");
    double? organicSliderValue = sharedPreferences.getDouble("organicSliderValue");
    double? qualitySeedSliderValue = sharedPreferences.getDouble("qualitySeedSliderValue");
    envTotal = (transportSliderValue ?? 0) + (modernFarmingSliderValue ?? 0) + (storageSliderValue ?? 0)
    + (wasteSliderValue ?? 0) + (seasonSliderValue ?? 0) + (waterSupSliderValue ?? 0) + (productionSliderValue ?? 0)
    + (weatherSliderValue ?? 0) + (organicSliderValue ?? 0) + (qualitySeedSliderValue ?? 0);
    _transportSliderValue = transportSliderValue ?? 0;
    _modernFarmingSliderValue = modernFarmingSliderValue ?? 0;
    _storageSliderValue = storageSliderValue ?? 0;
    _wasteSliderValue = wasteSliderValue ?? 0;
    _seasonSliderValue = seasonSliderValue ?? 0;
    _waterSupSliderValue = waterSupSliderValue ?? 0;
    _productionSliderValue = productionSliderValue ?? 0;
    _weatherSliderValue = weatherSliderValue ?? 0;
    _organicSliderValue = organicSliderValue ?? 0;
    _qualitySeedSliderValue = qualitySeedSliderValue ?? 0;
    await sharedPreferences.setDouble("envTotalValue", envTotal);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Environment Setup'),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Min"),
                      Text("Max"),
                    ],
                  ),
                  subtitle: Slider(
                    value: _transportSliderValue,
                    max: 10,
                    divisions: 10,
                    label: _transportSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _transportSliderValue = value;
                      });
                    },
                    onChangeEnd: (double value) async {
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("transportSliderValue", _transportSliderValue);
                    },
                  ),
                ),
              const Text("Transport Avialability (Min - 0, Max 10, Wt - 15%)",style: TextStyle(fontSize: 12),),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Min"),
                      Text("Max"),
                    ],
                  ),
                  subtitle: Slider(
                    value: _modernFarmingSliderValue,
                    max: 10,
                    divisions: 10,
                    label: _modernFarmingSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _modernFarmingSliderValue = value;
                      });
                    },
                    onChangeEnd: (double value)async{
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("modernFarmingSliderValue", _modernFarmingSliderValue);
                    },
                  ),
                ),
                const Text("Modern Farming Education (Min - 0, Max 10, , Wt - 10%)",style: TextStyle(fontSize: 12),),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Min"),
                      Text("Max"),
                    ],
                  ),
                  subtitle: Slider(
                    value: _storageSliderValue,
                    max: 10,
                    divisions: 10,
                    label: _storageSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _storageSliderValue = value;
                      });
                    },
                    onChangeEnd: (double value)async{
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("storageSliderValue", _storageSliderValue);
                    },
                  ),
                ),
                const Text("Storage Availability (Min - 0, Max 10, Wt - 14%)",style: TextStyle(fontSize: 12),),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Min"),
                      Text("Max"),
                    ],
                  ),
                  subtitle: Slider(
                    value: _wasteSliderValue,
                    max: 10,
                    divisions: 10,
                    label: _wasteSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _wasteSliderValue = value;
                      });
                    },
                    onChangeEnd: (double value)async{
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("wasteSliderValue", _wasteSliderValue);
                    },
                  ),
                ),
                const Text("Waste Management (Min - 0, Max 10, Wt - 8%)",style: TextStyle(fontSize: 12),),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Min"),
                      Text("Max"),
                    ],
                  ),
                  subtitle: Slider(
                    value: _seasonSliderValue,
                    max: 10,
                    divisions: 10,
                    label: _seasonSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _seasonSliderValue = value;
                      });
                    },
                    onChangeEnd: (double value)async{
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("seasonSliderValue", _wasteSliderValue);
                    },
                  ),
                ),
                const Text("Seasonal Farming (Min - 0, Max 10, Wt - 12%)",style: TextStyle(fontSize: 12),),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Min"),
                      Text("Max"),
                    ],
                  ),
                  subtitle: Slider(
                    value: _waterSupSliderValue,
                    max: 10,
                    divisions: 10,
                    label: _waterSupSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _waterSupSliderValue = value;
                      });
                    },
                    onChangeEnd: (double value)async{
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("waterSupSliderValue", _wasteSliderValue);
                    },
                  ),
                ),
                const Text("Water Supply Avialability (Min - 0, Max 10, Wt - 13%)",style: TextStyle(fontSize: 12),),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Min"),
                      Text("Max"),
                    ],
                  ),
                  subtitle: Slider(
                    value: _productionSliderValue,
                    max: 10,
                    divisions: 10,
                    label: _productionSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _productionSliderValue = value;
                      });
                    },
                    onChangeEnd: (double value)async{
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("productionSliderValue", _productionSliderValue);
                    },
                  ),
                ),
                const Text("Production per unit (Min - 0, Max 10, Wt - 20%)",style: TextStyle(fontSize: 12),),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Min"),
                      Text("Max"),
                    ],
                  ),
                  subtitle: Slider(
                    value: _weatherSliderValue,
                    max: 10,
                    divisions: 10,
                    label: _weatherSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _weatherSliderValue = value;
                      });
                    },
                    onChangeEnd: (double value)async{
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("weatherSliderValue", _weatherSliderValue);
                    },
                  ),
                ),
                const Text("Favourable weather condition (Min - 0, Max 10, Wt - 13%)",style: TextStyle(fontSize: 12),),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Min"),
                      Text("Max"),
                    ],
                  ),
                  subtitle: Slider(
                    value: _organicSliderValue,
                    max: 10,
                    divisions: 10,
                    label: _organicSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _organicSliderValue = value;
                      });
                    },
                    onChangeEnd: (double value)async{
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("organicSliderValue", _organicSliderValue);
                    },
                  ),
                ),
                const Text("Organic Farming Practice (Min - 0, Max 11%)",style: TextStyle(fontSize: 12),),
                ListTile(
                  title: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Min"),
                      Text("Max"),
                    ],
                  ),
                  subtitle: Slider(
                    value: _qualitySeedSliderValue,
                    max: 10,
                    divisions: 10,
                    label: _qualitySeedSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _qualitySeedSliderValue = value;
                      });
                    },
                    onChangeEnd: (double value)async{
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("qualitySeedSliderValue", _qualitySeedSliderValue);
                    },
                  ),
                ),
                const Text("Quality of Seed (Min - 0, Max 10, Wt - 15%)",style: TextStyle(fontSize: 12),),
                const SizedBox(height: 40,),
              ],
            )),
      ),
    );
  }
}
