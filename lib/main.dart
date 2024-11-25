import 'package:crypto_future_builder/services/theme_service.dart';
import 'package:crypto_future_builder/theme.dart';
import 'package:crypto_future_builder/view/crypto_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  //runApp(const MyApp());
  //Use Provider(ThemeService Class)
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //return const DefultCode();
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode:ThemeMode.dark,
      theme: AppTheme.lightTheme,
      //theme: appTheme,
      darkTheme: AppTheme.darkTheme,
        home: const CryptoScreen(),
       
      );
    });
  }

}