import 'package:flora/data.dart';
import 'package:flora/screens/plants/selected_plant_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantScreen extends StatefulWidget {
  const PlantScreen({super.key});

  static const String id = 'PlantScreen';

  @override
  State<PlantScreen> createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Text('AAAAAA'),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: plants.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          print(plants[index].id.toString() + " selected");
                          Navigator.pushNamed(
                            context,
                            SelectedPlantScreen.id,
                            arguments: {'selectedPlant': plants[index]},
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: Colors.teal),
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
                                    child: const Center(child: Text('Image')),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          plants[index].plantName,
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 32.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            plants[index].shortInfo,
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 4)
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
