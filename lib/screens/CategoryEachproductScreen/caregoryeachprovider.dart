import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:local_farmers_project/screens/CategoryEachproductScreen/categoryeachmodel.dart';




class CategoryEachProvider with ChangeNotifier {
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

  

  List<CategoryDetails> _category = [];
  List<CategoryDetails> get category {
    return [..._category];
  }
   List<CategoryDetails> _searchProducts = [];
  List<CategoryDetails> get searchProducts {
    return [..._searchProducts];
  }

  Future getAllEachCategorysData({required BuildContext context,required String categoryproduct}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/search_productby_category.php?category_id=$categoryproduct"),
      );

      print(
            "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/search_productby_category.php?category_id=$categoryproduct");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _category = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> catDetails = extractedData['productDetails'];
        for (var i = 0; i < catDetails.length; i++) {
          _category.add(
            CategoryDetails(
              
              productId: catDetails[i]['product_id'].toString(),
              productName: catDetails[i]['product_name'].toString(),
              quantity: catDetails[i]['quantity'].toString(),
              description: catDetails[i]['description'].toString(), 
              additionalInformation: catDetails[i]['additional_information'].toString(),
              price:catDetails[i]['price'].toString(),
              category: catDetails[i]['category'].toString(),
              categoryId: catDetails[i]['category_id'].toString(),
              farmer: catDetails[i]['farmer'].toString(),
              image: catDetails[i]['image'].toString(),

            ),
          );
        }
        ;

        print('product details' + _category.toString());
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
   Future<void> getSearchData({dynamic value}) async {
    _isLoading = true;
    var response = await https.get(
      Uri.parse(
          "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/search_productby_category.php?category_id=$value"),
    );

    print(
        "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/search_productby_category.php?category_id=$value");

    if (response.statusCode == 200) {
      var responseBody = response.body;

        print(responseBody);

        _searchProducts = [];

        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> catDetails = extractedData['productDetails'];
        for (var i = 0; i < catDetails.length; i++) {
          _searchProducts.add(
             CategoryDetails(
              
              productId: catDetails[i]['product_id'].toString(),
              productName: catDetails[i]['product_name'].toString(),
              quantity: catDetails[i]['quantity'].toString(),
              description: catDetails[i]['description'].toString(),
              additionalInformation: catDetails[i]['additional_information'].toString(),
              price:catDetails[i]['price'].toString(),
              category: catDetails[i]['category'].toString(),
              categoryId: catDetails[i]['category_id'].toString(),
              farmer: catDetails[i]['farmer'].toString(),
              image: catDetails[i]['image'].toString(),

            ),
          );
        }

        print('product details search' + _searchProducts.toString());
        print('products loading completed --->' + 'loading data');
          _isLoading = false;
        notifyListeners();


    } else {
        _isLoading = false;
          notifyListeners();
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }

    _isLoading = false;
    notifyListeners();
  }
}
  
 
