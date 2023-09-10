import 'package:flutter/material.dart';
import 'package:frontend/package/features/auth/models/user_model.dart';
import 'package:frontend/package/features/auth/verse_auth.dart';
import 'package:provider/provider.dart';
import 'package:verse_dashboard/constants/runtime_variables.dart';
import 'package:verse_dashboard/features/auth/presentation/pages/auth_page.dart';
import 'package:verse_dashboard/features/home/presentation/pages/home_page.dart';
import 'package:verse_dashboard/features/home/presentation/widgets/connected_apps_provider.dart';
import 'package:verse_dashboard/init/verse_init.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs
// flutter pub run build_runner watch --delete-conflicting-outputs

void main() async {
  await VerseInit.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectedAppsProvider(),
        )
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
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
                return const HomePage();
              }
            }),
      ),
    );
  }
}
