import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:local_farmers_project/screens/ProfileScreen/usermodel.dart';
import 'package:local_farmers_project/screens/ViewProducts%20Provider/productmodel.dart';

class UserProvider with ChangeNotifier {
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

  ProductDetails? productDetail;

  List<UserData> _users = [];
  List<UserData> get users {
    return [..._users];
  }

  String? currentUserId;
  void setCurrentUserId(String userId) {
    currentUserId = userId;
    notifyListeners();
  }

  Future getUsertData({BuildContext? context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_user.php?userid=$currentUserId"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_user.php?userid=$currentUserId");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _users = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> userDetails = extractedData['userData'];
        for (var i = 0; i < userDetails.length; i++) {
          _users.add(
            UserData(
                id: userDetails[i]['id'].toString(),
                name: userDetails[i]['name'].toString(),
                phone: userDetails[i]['phone'].toString(),
                email: userDetails[i]['email'].toString(),
                password: userDetails[i]['password'].toString(),
                image: userDetails[i]['image'].toString(),
                address: userDetails[i]['address'].toString(),
                state: userDetails[i]['state'].toString(),
                userType: userDetails[i]['user_type'].toString()),
          );
        }
        ;

        print('product details' + _users.toString());
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