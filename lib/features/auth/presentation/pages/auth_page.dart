// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frontend/package/features/auth/verse_auth.dart';
import 'package:shared_code/shared_code.dart';
import 'package:verse_dashboard/constants/global_constants.dart';
import 'package:verse_dashboard/features/auth/data/datasources/auth_datasource.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthDatasource authDatasource = AuthDatasource();
  @override
  void initState() {
    userNameController.text = GC.userName;
    passwordController.text = GC.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaddingWrapper(
        child: Container(
          alignment: Alignment.center,
          child: Container(
            constraints: BoxConstraints(maxWidth: 350),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                Text(
                  'Verse Login',
                  style: h2TextStyle,
                ),
                VSpace(
                  factor: 2,
                ),
                FancyTextField(
                  hint: 'Enter your username',
                  padding: EdgeInsets.zero,
                  controller: userNameController,
                ),
                VSpace(factor: .5),
                FancyTextField(
                  hint: 'Enter your password',
                  padding: EdgeInsets.zero,
                  controller: passwordController,
                  password: true,
                  showPasswordSvgPath: 'assets/svg/eye-open.svg',
                  hidePasswordSvgPath: 'assets/svg/eye-closed.svg',
                ),
                VSpace(),
                MainButton(
                  borerRadius: mediumBorderRadius,
                  onTap: () async {
                    print('before');
                    var user = await VerseAuth.instance.loginEmailPassword(
                      email: 'lloll111',
                      password: 'lloll111',
                    );
                    print(user);
                  },
                  title: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
