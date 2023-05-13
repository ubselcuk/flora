import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flora/components/custom_button.dart';
import 'package:flora/components/custom_text_field.dart';
import 'package:flora/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool remember = false;
  String user = '';
  String pass = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: loginMainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Kayıt',
              style: GoogleFonts.poppins(
                color: loginFontColor,
                fontWeight: FontWeight.w600,
                fontSize: 64.0,
              ),
            ),
            Column(
              children: [
                CustomTextField(
                  hintText: 'Kullanıcı Adı',
                  icon: Icons.person,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    user = value != '' ? value : '';
                  },
                ),
                CustomTextField(
                  hintText: 'Şifre',
                  icon: Icons.key,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    pass = value != '' ? value : '';
                  },
                ),
                CustomTextField(
                  hintText: 'Email',
                  icon: Icons.mail_rounded,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    email = value != '' ? value : '';
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomButton(
                        label: 'Kayıt Ol',
                        btn: false,
                        onPressed: () {
                          if (user == '' || pass == '' || email == '') {
                            showOkAlertDialog(
                              context: context,
                              okLabel: "Tamam",
                              title:
                                  "Kullanıcı adı, şifre veya email boş geçilemez!",
                              style: AdaptiveStyle.iOS,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
