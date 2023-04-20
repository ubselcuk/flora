import 'package:flora/constants.dart';
import 'package:flora/screens/home/home_screen.dart';
import 'package:flora/screens/login/login_screen.dart';
import 'package:flora/screens/login/register_screen.dart';
import 'package:flora/screens/plants/plants_screen.dart';
import 'package:flora/screens/plants/selected_plant_screen.dart';
import 'package:flora/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: mainTitle,
      theme: mainThemeData,
      home: const SplashScreen(),
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        SplashScreen.id: (context) => const SplashScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        PlantScreen.id: (context) => const PlantScreen(),
        SelectedPlantScreen.id: (context) => const SelectedPlantScreen(),
      },
    );
  }
}
