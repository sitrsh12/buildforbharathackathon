import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnvSetup extends StatefulWidget {
  @override
  State<EnvSetup> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<EnvSetup> {

  double _transportSliderValue = 0;
  double _modernFarmingSliderValue = 0;
  double _storageSliderValue = 0;
  double _wasteSliderValue = 0;
  double _seasonSliderValue = 0;
  double _waterSupSliderValue = 0;
  double _productionSliderValue = 0;
  double _weatherSliderValue = 0;
  double _organicSliderValue = 0;
  double _qualitySeedSliderValue = 0;


  @override
  void initState() {
    _getEnv();
    super.initState();
  }
  double envTotal = 0;
  double envAverage = 0;
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
    _transportSliderValue = transportSliderValue ?? 10;
    _modernFarmingSliderValue = modernFarmingSliderValue ?? 10;
    _storageSliderValue = storageSliderValue ?? 10;
    _wasteSliderValue = wasteSliderValue ?? 10;
    _seasonSliderValue = seasonSliderValue ?? 10;
    _waterSupSliderValue = waterSupSliderValue ?? 10;
    _productionSliderValue = productionSliderValue ?? 10;
    _weatherSliderValue = weatherSliderValue ?? 10;
    _organicSliderValue = organicSliderValue ?? 10;
    _qualitySeedSliderValue = qualitySeedSliderValue ?? 10;
    envAverage = envTotal/10;
    await sharedPreferences.setDouble("envTotalValue", envAverage);
    // debugPrint(envAverage.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Environment Setup'),
            Text("Increment Rate: $envAverage", style: const TextStyle(fontSize: 16,color: Colors.orangeAccent),),
          ],
        ),
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
                    onChanged: (double value) async {
                        _transportSliderValue = value;
                        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        sharedPreferences.setDouble("transportSliderValue", _transportSliderValue);
                        _getEnv();
                        setState(() {});
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
                      onChanged: (double value) async {
                        _modernFarmingSliderValue = value;
                        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        sharedPreferences.setDouble("modernFarmingSliderValue", _modernFarmingSliderValue);
                        _getEnv();
                        setState(() {});
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
                    onChanged: (double value) async {
                      _storageSliderValue = value;
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("storageSliderValue", _storageSliderValue);
                      _getEnv();
                      setState(() {});
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
                    onChanged: (double value) async {
                      _wasteSliderValue = value;
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("wasteSliderValue", _wasteSliderValue);
                      _getEnv();
                      setState(() {});
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
                    onChanged: (double value) async {
                      _seasonSliderValue = value;
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("seasonSliderValue", _seasonSliderValue);
                      _getEnv();
                      setState(() {});
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
                    onChanged: (double value) async {
                      _waterSupSliderValue = value;
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("waterSupSliderValue", _waterSupSliderValue);
                      _getEnv();
                      setState(() {});
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
                    onChanged: (double value) async {
                      _productionSliderValue = value;
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("productionSliderValue", _productionSliderValue);
                      _getEnv();
                      setState(() {});
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
                    onChanged: (double value) async {
                      _weatherSliderValue = value;
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("weatherSliderValue", _weatherSliderValue);
                      _getEnv();
                      setState(() {});
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
                    onChanged: (double value) async {
                      _organicSliderValue = value;
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("organicSliderValue", _organicSliderValue);
                      _getEnv();
                      setState(() {});
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
                    onChanged: (double value) async {
                      _qualitySeedSliderValue = value;
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setDouble("qualitySeedSliderValue", _qualitySeedSliderValue);
                      _getEnv();
                      setState(() {});
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
