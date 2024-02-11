import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BananaSliderPage extends StatefulWidget {
  @override
  State<BananaSliderPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BananaSliderPage> {
  @override
  void initState() {
    readBananaData();
    super.initState();
  }
  final StreamController<int> _events = StreamController<int>.broadcast();
  int count = 0;
  Timer? _timer;
  void _startCounter() {
    count = 10;
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      (count > 0) ? count-- : _timer?.cancel();
      _events.add(count);
    });
  }
  void dispose() {
    super.dispose();
    _events.close();
  }

  double _currentBananaValue = 60;
  String assignedBananaPrice = "0.0";
  String buyerCount = "0";
  void readBananaData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NpywQutLP57oatKEabR");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      assignedBananaPrice = values["assignedPrice"].toString();
      buyerCount = values["distance"].toString();
      _currentBananaValue = double.parse(values["recommendBuyPrice"].toString());
      setState(() {});
      _startCounter();
    });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: Text("₹$assignedBananaPrice",
                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Average Buying Price",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  StreamBuilder(stream: _events.stream,
                      builder: (context, snapshot) {
                        return Text(count.toString()=="0"?"Price Expired":count.toString(),style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w700, fontSize: 20),);
                      }
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: width / 2.8,
                    child: ListTile(
                      visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text("Grocery"),
                      subtitle: Text("Banana"),
                    ),
                  ),
                  SizedBox(
                    width: width / 2.8,
                    child: ListTile(
                      visualDensity: const VisualDensity(
                          horizontal: 0, vertical: -4),
                      title: const Text("Buyer Price"),
                      subtitle:
                      Text(_currentBananaValue.toStringAsFixed(2)),
                    ),
                  ),
                  SizedBox(
                    width: width / 2.8,
                    child: ListTile(
                      visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -4),
                      title: const Text("Search Count"),
                      subtitle: Text(buyerCount),
                    ),
                  ),
                ],
              )
            ],
          ),
          Slider(
            value: assignedBananaPrice != "0.0" ? _currentBananaValue : 1,
            max: double.parse(assignedBananaPrice != "0.0" ? assignedBananaPrice:"1" )*2,
            divisions: int.parse(assignedBananaPrice != "0.0" ? assignedBananaPrice:"1")*2,
            label: _currentBananaValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentBananaValue = value;
              });
            },
            onChangeEnd: (double value){
              DatabaseReference databaseReference =
              FirebaseDatabase.instance.reference().child('grocery');
              databaseReference.child('-NpywQutLP57oatKEabR').update({
                'recommendBuyPrice': _currentBananaValue
              });
            },
          ),
        ],
      ),
    );
  }
}
