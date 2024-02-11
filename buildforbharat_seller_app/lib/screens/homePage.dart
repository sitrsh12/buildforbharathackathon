import 'dart:async';

import 'package:buildforbharat_seller_app/widget/breadSliderPage.dart';
import 'package:buildforbharat_seller_app/widget/hairCutSliderPage.dart';
import 'package:buildforbharat_seller_app/widget/milkSliderPage.dart';
import 'package:buildforbharat_seller_app/widget/spaSliderPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../widget/appleSliderPage.dart';
import '../widget/bananaSliderPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Build For Bharat Hackathon\nSeller Setup', textAlign: TextAlign.center,)),
      elevation: 20,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppleSliderPage(),
            BananaSliderPage(),
            HairCutSliderPage(),
            SpaSliderPage(),
            BreadSliderPage(),
            MilkSliderPage()
          ],
        )
      ),
    );
  }
}
