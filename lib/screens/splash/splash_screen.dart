import 'dart:math';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flora/constants.dart';
import 'package:flora/data.dart';
import 'package:flora/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String id = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: _screen(context),
    );
  }

  Widget _screen(BuildContext context) {
    var randomPlant = Random().nextInt(plants.length);
    return Container(
      color: splashMainColor.shade100,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
            icon: Icon(
              EvaIcons.battery,
              color: splashMainColor,
              size: 32,
            ),
          ),
          Text(
            'FLORA',
            style: GoogleFonts.poppins(
              color: splashMainColor,
              fontWeight: FontWeight.w600,
              fontSize: 64.0,
            ),
          ),
          SizedBox(
            height: 250,
            width: 250,
            child: Container(
              color: splashMainColor.shade200,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            plants[randomPlant].plantName,
            style: GoogleFonts.poppins(
              color: splashMainColor,
              fontWeight: FontWeight.w600,
              fontSize: 22.0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              plants[randomPlant].info,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: splashMainColor,
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 70,
            height: 70,
            child: LoadingIndicator(
              indicatorType: Indicator.orbit,
              colors: [splashMainColor.shade300],
            ),
          )
        ],
      ),
    );
  }
}
