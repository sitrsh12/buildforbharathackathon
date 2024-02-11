import 'package:buildforbharat/firebase_options.dart';
import 'package:buildforbharat/provider/env_provider.dart';
import 'package:buildforbharat/screens/homePage.dart';
import 'package:buildforbharat/screens/loginPage.dart';
import 'package:buildforbharat/widget/distanceSlider.dart';
import 'package:buildforbharat/widget/productSlider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<EnvProvider>(
            create: (_) => EnvProvider()
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Env Setup',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}


