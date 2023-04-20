import 'package:flutter/material.dart';

class SelectedPlantScreen extends StatefulWidget {
  const SelectedPlantScreen({super.key});
  static const String id = 'SelectedPlantScreen';

  @override
  State<SelectedPlantScreen> createState() => _SelectedPlantScreenState();
}

class _SelectedPlantScreenState extends State<SelectedPlantScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return Container(
      child: Text(arguments['selectedPlant'].id.toString()),
    );
  }
}
