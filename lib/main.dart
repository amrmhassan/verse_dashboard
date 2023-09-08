import 'package:flutter/material.dart';
import 'package:frontend/package/features/auth/models/user_model.dart';
import 'package:frontend/package/features/auth/verse_auth.dart';
import 'package:verse_dashboard/features/auth/presentation/pages/auth_page.dart';
import 'package:verse_dashboard/init/verse_init.dart';

void main() async {
  await VerseInit.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Verse Dashboard',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: StreamBuilder<VerseUser?>(
          stream: VerseAuth.instance.userChanges,
          builder: (context, snapshot) {
            var user = snapshot.data;
            if (user == null) {
              return const AuthPage();
            } else {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      VerseAuth.instance.logout(logoutFromBackend: false);
                    },
                    child: const Text(
                      'Logout',
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
