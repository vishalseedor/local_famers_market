import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:local_farmers_project/screens/CategoryProvider/categorymodel.dart';
import 'package:local_farmers_project/screens/MyOrderScreen/model/ordermodel.dart';


class Orderprovider with ChangeNotifier {
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
 
  List<Ordermodel> _orders = [];
  List<Ordermodel> get orders {
    return [..._orders];
  }

  Future<void>getAllOrdersData({required BuildContext context,String? userid}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/farmers_Market/api/view_order_history.php?userid=$userid"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/farmers_Market/api/view_order_history.php?userid=$userid");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _orders = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> orderDetails = extractedData['orderHistory'];
        for (var i = 0; i < orderDetails.length; i++) {
          _orders.add(
            Ordermodel(
              billingId:orderDetails[i]['billing_id'].toString(),
              orderStatus:orderDetails[i]['order_status'].toString(),
              orderCreated: orderDetails[i]['order_created'].toString(),
              cartId: orderDetails[i]['cart_id'].toString(),
              cartQuantity: orderDetails[i]['cart_quantity'].toString(),
              productDescription: orderDetails[i]['product_description'].toString(),
              productId: orderDetails[i]['product_id'].toString(),
              productName: orderDetails[i]['product_name'].toString(),
              productPrice: orderDetails[i]['product_price'].toString(),
             
              
    
            ),

          );
        }
        ;

        print('product details' + _orders.toString());
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