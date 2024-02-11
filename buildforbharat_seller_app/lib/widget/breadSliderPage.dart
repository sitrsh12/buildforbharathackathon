import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BreadSliderPage extends StatefulWidget {
  @override
  State<BreadSliderPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BreadSliderPage> {
  @override
  void initState() {
    readBreadData();
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

  double _currentBreadValue = 40;
  String assignedBreadPrice = "0.0";
  String buyerCount = "0";
  void readBreadData() {
    DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref('grocery').child("-NpywSMHcSLrVg5WodQh");
    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      dynamic values = dataSnapshot.value;
      assignedBreadPrice = values["assignedPrice"].toString();
      buyerCount = values["distance"].toString();
      _currentBreadValue = double.parse(values["recommendBuyPrice"].toString());
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
                    child: Text("₹$assignedBreadPrice",
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
                      subtitle: Text("Bread"),
                    ),
                  ),
                  SizedBox(
                    width: width / 2.8,
                    child: ListTile(
                      visualDensity: const VisualDensity(
                          horizontal: 0, vertical: -4),
                      title: const Text("Buyer Price"),
                      subtitle:
                      Text(_currentBreadValue.toStringAsFixed(2)),
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
            value: assignedBreadPrice != "0.0" ? _currentBreadValue : 1,
            max: double.parse(assignedBreadPrice != "0.0" ? assignedBreadPrice:"1" )*2,
            divisions: int.parse(assignedBreadPrice != "0.0" ? assignedBreadPrice:"1")*2,
            label: _currentBreadValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentBreadValue = value;
              });
            },
            onChangeEnd: (double value){
              DatabaseReference databaseReference =
              FirebaseDatabase.instance.reference().child('grocery');
              databaseReference.child('-NpywSMHcSLrVg5WodQh').update({
                'recommendBuyPrice': _currentBreadValue
              });
            },
          ),
        ],
      ),
    );
  }
}
