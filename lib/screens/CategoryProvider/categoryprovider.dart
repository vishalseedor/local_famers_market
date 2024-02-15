import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:local_farmers_project/screens/CategoryProvider/categorymodel.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/productmodel.dart';

class CategoryProvider with ChangeNotifier {
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

  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories {
    return [..._categories];
  }

  Future getAllCategoryData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_category.php?farmer_id=1"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_category.php?farmer_id=1");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _categories = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> categoryDetails = extractedData['categoryDetails'];
        for (var i = 0; i < categoryDetails.length; i++) {
          _categories.add(
            CategoryModel(
              id: categoryDetails[i]['id'].toString(),
              name: categoryDetails[i]['name'].toString(),
              quantity: categoryDetails[i]['quantity'].toString(),
              farmerid: categoryDetails[i]['farmer_id'].toString(),
              image: categoryDetails[i]['image'].toString()
    
            ),

          );
        }
        ;

        print('product details' + _categories.toString());
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