import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: TextButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(
                side: BorderSide(color: Colors.black),
              ),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white),
          child: const Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Text('Go Back'),
          ),
        ),
      ),
    );
  }
}
