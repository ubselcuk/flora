import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flora/constants.dart';
import 'package:flora/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Container(
      color: Colors.teal.shade100,
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
              color: Colors.teal.shade200,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Papatya',
            style: GoogleFonts.poppins(
              color: splashMainColor,
              fontWeight: FontWeight.w600,
              fontSize: 22.0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Çiçek işte aw bişeyler bişeyler\nbişeyler daha bişeyler',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: splashMainColor,
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          const CircularProgressIndicator(
            color: Colors.teal,
          )
        ],
      ),
    );
  }
}
