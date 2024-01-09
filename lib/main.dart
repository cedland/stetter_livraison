import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'AgemoPages/PageConnexion/Connexion_screen.dart';
import 'AgemoPages/couleurs.dart';
import 'models/cart_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


final theme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250),
  fontFamily: GoogleFonts.poppins().fontFamily,
  useMaterial3: true,
);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        supportedLocales: const [
          Locale('en'),
          Locale('fr')
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldbgColor,
        ),
          //home:AccueilScreen(),
       home:const ConnexionScreen(),
      ),
    );
  }
}
