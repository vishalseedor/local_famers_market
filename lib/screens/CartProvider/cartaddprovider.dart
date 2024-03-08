
import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/CartProvider/addtocartmodel.dart';
import 'package:http/http.dart'as http;

class AddtoCartProvider extends ChangeNotifier {
  List<AddCartItem> _cartItems = [];

  List<AddCartItem> get cartItems => _cartItems;
 
 void addToCart(AddCartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  Future addItemToCart({ String? productid,
  
   String? userid,
  
   String? quanity}) async {
      var body = {
    'product_id': productid.toString(),
    'user_id': userid.toString(),
    'quantity': quanity.toString(),
  };

  try {
    var response = await http.post(Uri.parse('http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/add_cart.php?product_id=$productid&user_id=$userid&quantity=$quanity'),
        body: body);

    if (response.statusCode == 200) {
      // Request successful
      print('Added to cart successfully');
      print('Response: ${response.body}');
    } else {
      // Request failed with error code
      print('Failed to add to cart. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    // Exception thrown during request
    print('Failed to add to cart. Exception: $e');
  }
    
  }
}
