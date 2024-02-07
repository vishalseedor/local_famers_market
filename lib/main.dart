import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/CategoryProvider/allcategoryscreen.dart';
import 'package:local_farmers_project/screens/CategoryProvider/categoryprovider.dart';
import 'package:local_farmers_project/screens/FarmerProvider/allfarmerscreen.dart';
import 'package:local_farmers_project/screens/FarmerProvider/farmprovider.dart';
import 'package:local_farmers_project/screens/ItemDetailsScreen/itemdetailsscreen.dart';
import 'package:local_farmers_project/screens/SplashScreen/spalshscreen.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/allproductscreen.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/productprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context) => ProductProvider()),
          ChangeNotifierProvider(create: (context) => FarmProvider()),
          ChangeNotifierProvider(create: (context)=>CategoryProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        routes: {
          'all_product_screen': (context) => const AllProductScreen(),
            'product_details_screen': (context) {
    String id = ModalRoute.of(context)!.settings.arguments.toString();
    return ItemDetailScreen(
      id: id,
    );
  },
  'all_farmer_screen':(context) => const AllFarmersScreen(),
  'all_category_screen':(context) => const AllCategoryScreen()
        },
      ),
    );
  }
}

