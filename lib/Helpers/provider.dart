
import 'package:local_farmers_project/screens/CartProvider/cartprovider.dart';
import 'package:local_farmers_project/screens/CategoryEachproductScreen/caregoryeachprovider.dart';
import 'package:local_farmers_project/screens/CategoryProvider/categoryprovider.dart';
import 'package:local_farmers_project/screens/FarmerProvider/farmprovider.dart';
import 'package:local_farmers_project/screens/MyOrderScreen/api/orderprovider.dart';
import 'package:local_farmers_project/screens/SupportScreen/supportprovider.dart';
import 'package:local_farmers_project/screens/UserProvider/userprovider.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/productprovider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> multiprovider = [
  ChangeNotifierProvider(create: (context) => ProductProvider()),
  ChangeNotifierProvider(create: (context) => FarmProvider()),
  ChangeNotifierProvider(create: (context) => CategoryProvider()),
  ChangeNotifierProvider(create: (context) => CartProvider()),
  ChangeNotifierProvider(create: (context) => CategoryEachProvider()),
  ChangeNotifierProvider(create: (context) => UserProvider()),
  ChangeNotifierProvider(create: (context) => FeedbackProvider()),
  ChangeNotifierProvider(create: (context)=>Orderprovider())
];
