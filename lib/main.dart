import 'package:comisariato/config/Routes/app_router.dart';
import 'package:comisariato/config/user_preferences/user_preferences.dart';
import 'package:comisariato/firebase_options.dart';
import 'package:comisariato/services/producto_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPrefs();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [//ChangeNotifierProvider(create: ()=> LoginProvider()),
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routerConfig: route,
      ),
    );
  }
}
