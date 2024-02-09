import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:local_farmers_project/screens/CartProvider/cartmodel.dart';
import 'package:local_farmers_project/screens/FarmerProvider/farmermodel.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/productmodel.dart';

class CartProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }

  List<CartDetails> _carts = [];
  List<CartDetails> get carts {
    return [..._carts];
  }

  Future getAllCartsData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_cart.php?userid=1"),
      );

      print(
            "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_cart.php?userid=1");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _carts = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> cartDetails = extractedData['cart_Details'];
        for (var i = 0; i < cartDetails.length; i++) {
          _carts.add(
            CartDetails(
              cartId: cartDetails[i]['cart_id'].toString(),
              productId: cartDetails[i]['product_id'].toString(),
              image: cartDetails[i]['image'].toString(),
              productName: cartDetails[i]['product_name'].toString(),
              price:cartDetails[i]['price'].toString(),
              quantity: cartDetails[i]['quantity'].toString(),
              itemTotal: cartDetails[i]['item_total'].toString()

              
            ),
          );
        }
        ;

        print('product details' + _carts.toString());
        _isLoading = false;
        print('products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print('error in product prod -->>' + e.toString());
      print('Product Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
 
}