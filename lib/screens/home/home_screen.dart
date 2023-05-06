import 'package:flora/components/custom_button.dart';
import 'package:flora/screens/plants/plants_screen.dart';
import 'package:flutter/material.dart';

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
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(DateTime.now().weekdayName().toString()),
            const Text('BBB')
          ],
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 200),
          CustomButton(
            label: '+',
            btn: true,
            ico: Icons.add,
            onPressed: () {
              Navigator.pushNamed(context, PlantScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
