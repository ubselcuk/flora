import 'package:flora/components/custom_text_field.dart';
import 'package:flora/constants.dart';
import 'package:flora/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SelectedPlantScreen extends StatefulWidget {
  const SelectedPlantScreen({super.key});
  static const String id = 'SelectedPlantScreen';

  @override
  State<SelectedPlantScreen> createState() => _SelectedPlantScreenState();
}

class _SelectedPlantScreenState extends State<SelectedPlantScreen> {
  String pi = '';
  bool vis = true;
  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as Map;
    var myPlant = arguments['selectedPlant'];
    return Scaffold(
      body: Container(
        color: plantsBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                color: Colors.teal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    _image(),
                    Text(
                      myPlant.plantName,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 60.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
                Visibility(
                  visible: vis,
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          myPlant.info,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                /*
                Visibility(
                  visible: vis,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 8, top: 8),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(60),
                          ),
                          color: Colors.white),
                      child: Row(
                        children: const [
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),*/
                Visibility(
                  visible: !vis,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballPulseSync,
                        colors: [splashMainColor.shade50],
                      ),
                    ),
                  ),
                ),
                CustomTextField(
                  hintText: 'Saksı numarası',
                  icon: Icons.numbers,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    pi = value != '' ? value : '';
                  },
                  onTap: () {
                    setState(() {
                      vis = false;
                    });
                  },
                  onTapOutside: (p0) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    setState(() {
                      vis = true;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.teal.shade100),
        child: Image.asset('assets/qwe.png'),
      ),
    );
  }
}
