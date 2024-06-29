import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:blingpay_assesment/app_colors.dart';
import 'package:blingpay_assesment/features/users/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {

  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      light: ThemeData(
        // This is the light theme of the application.
          colorScheme: ColorScheme.fromSeed(
              seedColor: veryDarkBlue, onSurface: Colors.white,),
          useMaterial3: true,
          textTheme: GoogleFonts.rubikTextTheme()),
      dark: ThemeData(
        // This is the dark theme of the application.
          colorScheme: ColorScheme.fromSeed(
              seedColor: veryDarkBlue, onSurface: veryDarkBlue),
          useMaterial3: true,
          textTheme: GoogleFonts.rubikTextTheme()),
      builder: (ThemeData light, ThemeData dark) {
        return MaterialApp(
          title: 'Bling Social',
          debugShowCheckedModeBanner: false,
          theme: light,
          home: const HomePage(),
        );
      },
    );
  }
}

