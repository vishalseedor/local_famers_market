import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/CartProvider/allcartscreen.dart';
import 'package:local_farmers_project/screens/CategoryEachproductScreen/allcategoryeachscreen.dart';
import 'package:local_farmers_project/screens/CategoryProvider/allcategoryscreen.dart';
import 'package:local_farmers_project/screens/FarmerProvider/allfarmerscreen.dart';
import 'package:local_farmers_project/screens/FarmerProvider/farmdetailsscreen.dart';
import 'package:local_farmers_project/screens/ItemDetailsScreen/itemdetailsscreen.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/allproductscreen.dart';

var customRoutes = <String, WidgetBuilder>{
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
};
