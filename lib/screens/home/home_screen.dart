import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flora/components/custom_button.dart';
import 'package:flora/constants.dart';
import 'package:flora/data.dart';
import 'package:flora/screens/plants/plants_screen.dart';
import 'package:flora/sql.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

extension DateTimeExtension on DateTime {
  String? weekdayName() {
    const Map<int, String> weekdayName = {
      1: "Pazartesi",
      2: "Salı",
      3: "Çarşamba",
      4: "Perşembe",
      5: "Cuma",
      6: "Cumartesi",
      7: "Pazar"
    };
    return weekdayName[weekday];
    //
  }
}

/*
CustomButton(
  label: '+',
  btn: true,
  ico: Icons.add,
  onPressed: () {
    Navigator.pushNamed(context, PlantScreen.id);
  },
),
*/

class Plants {
  int? id;
  int? humid;
  String? name;
  String? imagePath;
  int? type;
  Plants(this.id, this.humid, this.name, this.imagePath, this.type);
}

List<Plants> garden = [];
bool gardenLock = true;

class _HomeScreenState extends State<HomeScreen> {
  getPlants() async {
    garden = [];
    var dbPlants = await db('SELECT * FROM plants WHERE "user"=$globalId');
    for (var p in dbPlants) {
      garden.add(Plants(p[0], p[1], p[2], p[5], p[6]));
    }
    gardenLock = false;
    setState(() {});
  }

  bool lock = true;

  @override
  void initState() {
    getPlants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              children: [
                _topBar(context),
                Expanded(child: SingleChildScrollView(child: _plants())),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _plants() {
    return gardenLock == true
        ? Text('Loading')
        : Container(
            child: Column(
              children: [
                for (var i = 0; i < garden.length; i++)
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                    child: InkWell(
                      onLongPress: () {
                        print(garden[i].id);
                        showOkCancelAlertDialog(
                          context: context,
                          okLabel: "Evet",
                          cancelLabel: "Hayır",
                          title: "Silmek istediğinizden emin misiniz?",
                          style: AdaptiveStyle.iOS,
                        ).then((value) async {
                          if (value == OkCancelResult.ok) {
                            await db(
                                'DELETE FROM plants WHERE id = ${garden[i].id}');
                            getPlants();
                            setState(() {});
                          }
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Color.fromARGB(255, 112, 197, 178)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                      color: Colors.teal.shade100),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Image.asset(
                                                garden[i].imagePath!),
                                          ))),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        garden[i].name ?? "Bilinmiyor",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 32.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Nem:",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      Row(
                                        children: water(i),
                                      ),
                                      const SizedBox(
                                        width: 0,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        (plants[garden[i].type! - 1].waterDay ??
                                                "Bilinmiyor") +
                                            " sulanır",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 4)
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          );
  }

  List<Widget> water(int i) {
    return [
      for (var a = 0; a < (garden[i].humid?.toInt() ?? 0) / 20; a++)
        Icon(
          Icons.water_drop_rounded,
          color: Colors.blue.shade600,
        ),
      for (var a = 0;
          a <
              4 -
                  (((garden[i].humid?.toInt() ?? 0) < 1)
                      ? (garden[i].humid?.toInt() ?? 0) - 1
                      : (garden[i].humid?.toInt() ?? 0) / 20);
          a++)
        Icon(
          Icons.water_drop_outlined,
          color: Colors.blue.shade600,
        )
    ];
  }

  Row _topBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            DateTime.now().weekdayName().toString(),
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal.shade50, width: 3.0),
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(500.0),
                    onTap: () {
                      getPlants();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal.shade50, width: 3.0),
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(500.0),
                    onTap: () {
                      Navigator.pushNamed(context, PlantScreen.id);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
