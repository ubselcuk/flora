import 'package:flora/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool remember = false;
  String user = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomTextField(
        hintText: 'Username',
        icon: Icons.person,
        keyboardType: TextInputType.name,
        onChanged: (value) {
          user = value != '' ? value : '';
        },
      ),
    );
  }
}
