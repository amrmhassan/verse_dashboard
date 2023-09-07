import 'package:flutter/material.dart';
import 'package:verse_dashboard/features/auth/presentation/pages/auth_page.dart';

void main() async {
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
      home: const AuthPage(),
    );
  }
}
