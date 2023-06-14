import 'dart:math';
import 'package:flora/constants.dart';
import 'package:flora/data.dart';
import 'package:flora/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String id = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

autoLogin(context) async {
  await Future.delayed(const Duration(seconds: 2))
      .then((value) => Navigator.pushNamed(context, LoginScreen.id));
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    //autoLogin(context);
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
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                'FLORA',
                style: GoogleFonts.poppins(
                  color: splashMainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 64.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              child: SizedBox(
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(44),
                  child: Container(
                    color: Colors.teal,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(plants[randomPlant].image),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                plants[randomPlant].plantName,
                style: GoogleFonts.poppins(
                  color: splashMainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
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
            ),
          ),
          Expanded(
            flex: 4,
            child: SizedBox(
              width: 70,
              height: 70,
              child: LoadingIndicator(
                indicatorType: Indicator.ballBeat,
                colors: [splashMainColor.shade300],
              ),
            ),
          )
        ],
      ),
    );
  }
}
