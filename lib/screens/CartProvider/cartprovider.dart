import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:local_farmers_project/screens/CartProvider/cartmodel.dart';
import 'package:local_farmers_project/screens/UserProvider/userprovider.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
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

  CartDetails? cartDetails;

  List<CartDetails> _carts = [];
  List<CartDetails> get carts {
    return [..._carts];
  }

  double totalAmount = 0.0;

  void updateQuantity(int index, String newQuantity) {
    _carts[index].quantity = newQuantity;
    calculateTotalPrice();
    notifyListeners();
  }

  // Calculate total amount
  double addQuantity(String price) {
    totalAmount += int.parse(price) * 1;
    notifyListeners();
    return totalAmount;
  }

  double removeQuantity(String price) {
    totalAmount -= int.parse(price) * 1;
    //  notifyListeners();
    return totalAmount;
  }

  double calculateTotalPrice() {
    totalAmount = 0.0;
    for (var item in _carts) {
      totalAmount += int.parse(item.price) * int.parse(item.quantity);
    }
    // notifyListeners();
    return double.parse(totalAmount.toString());
  }

  Future getAllCartsData({BuildContext? context, String? userid}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_cart.php?userid=$userid"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_cart.php?userid=$userid");

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
                price: cartDetails[i]['price'].toString(),
                quantity: cartDetails[i]['quantity'].toString(),
                itemTotal: cartDetails[i]['item_total'].toString(),
                delivertfee: cartDetails[i]['deliveryFee'].toString()),
          );
        }
        calculateTotalPrice();

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

  

  Future<void> deleteCart(String? cartId, BuildContext context) async {
    final user = Provider.of<UserProvider>(context, listen: false);
    final url = Uri.parse(
        'http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/delete_cart.php?cart_id=$cartId');

    try {
      final response = await https.delete(url);
      print(url);
      if (response.statusCode == 200) {
        getAllCartsData(userid: user.currentUserId);
        // Cart deleted successfully
        print('Cart deleted successfully');
      } else {
        // Failed to delete cart
        print('Failed to delete cart: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting cart: $e');
    }
  }

  Future<void> clearCart({String? userid}) async {
    final url = Uri.parse(
        'http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/clear_cart.php?user_id=$userid');

    try {
      final response = await https.delete(url);

      if (response.statusCode == 200) {
        print(url);
        getAllCartsData();
        // Cart deleted successfully
        print('Cart deleted successfully');
      } else {
        // Failed to delete cart
        print('Failed to delete cart: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting cart: $e');
    }
  }

  Future<void> quantityUpdate({String? userid, String? quantity}) async {
    final url = Uri.parse(
        'http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/update_quantity.php?cart_id=$userid&quantity=$quantity');

    try {
      final response = await https.get(url);

      if (response.statusCode == 200) {
        print(url);

        print('Cart quanity update successfully');
      } else {
        // Failed to delete cart
        print('Failed to quanity update: ${response.statusCode}');
      }
    } catch (e) {
      print('Error quantity update: $e');
    }
  }
}
Future<void> placeOrderApi({String? userid}) async {
    final url = Uri.parse(
        'http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/placed_order.php?user_id=$userid');

    try {
      final response = await https.get(url);

      if (response.statusCode == 200) {
        print(url);

        print('Placed order successfully');
      } else {
        // Failed to delete cart
        print('Failed to placed order: ${response.statusCode}');
      }
    } catch (e) {
      print('Error place oder: $e');
    }
  }

