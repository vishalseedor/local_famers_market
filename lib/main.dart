import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_farmers_project/Helpers/provider.dart';
import 'package:local_farmers_project/Helpers/routes.dart';
import 'package:local_farmers_project/colors/colors.dart';
import 'package:local_farmers_project/screens/SplashScreen/spalshscreen.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey="";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiprovider,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(),
            colorScheme: ColorScheme.fromSeed(seedColor:greencolor),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
          routes: customRoutes),
    );
  }
}
