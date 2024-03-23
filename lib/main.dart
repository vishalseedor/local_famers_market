import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_farmers_project/screens/CartProvider/allcartscreen.dart';

import 'package:local_farmers_project/screens/CartProvider/cartprovider.dart';
import 'package:local_farmers_project/screens/CategoryEachproductScreen/allcategoryeachscreen.dart';
import 'package:local_farmers_project/screens/CategoryEachproductScreen/caregoryeachprovider.dart';
import 'package:local_farmers_project/screens/CategoryProvider/allcategoryscreen.dart';
import 'package:local_farmers_project/screens/CategoryProvider/categoryprovider.dart';
import 'package:local_farmers_project/screens/FarmerProvider/allfarmerscreen.dart';
import 'package:local_farmers_project/screens/FarmerProvider/farmdetailsscreen.dart';
import 'package:local_farmers_project/screens/FarmerProvider/farmprovider.dart';
import 'package:local_farmers_project/screens/ItemDetailsScreen/itemdetailsscreen.dart';
import 'package:local_farmers_project/screens/SplashScreen/spalshscreen.dart';
import 'package:local_farmers_project/screens/SupportScreen/supportprovider.dart';
import 'package:local_farmers_project/screens/UserProvider/userprovider.dart';
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
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => CategoryEachProvider()),
       // ChangeNotifierProvider(create: (context) => AddtoCartProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => FeedbackProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
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
          'farmer_details_screen': (context) {
            String id = ModalRoute.of(context)!.settings.arguments.toString();
            return FarmerDetailsScreen(
              id: id,
            );
          },
          'all_farmer_screen': (context) => const AllFarmersScreen(),
          'all_category_screen': (context) => const AllCategoryScreen(),
          'all_cart_screen': (context) => const AllCartScreen(),
          'all_categoryproduct_screen': (context) {
            var data = ModalRoute.of(context)!.settings.arguments;
            if (data is String) {
              return AllCategoryEachScreen(cateproduct: data);
            } else if (data is Map<String, dynamic>) {
              return AllCategoryEachScreen(cateproduct: data['category_id']);
            } else {
              print('Unexpected argument type: ${data.runtimeType}');
              return const Scaffold(
                body: Center(
                  child: Text(''),
                ),
              );
            }
          },
        },
      ),
    );
  }
}
