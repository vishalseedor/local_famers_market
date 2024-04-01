import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:local_farmers_project/screens/FarmerProvider/farmermodel.dart';


class FarmProvider with ChangeNotifier {
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

  List<FarmDetails> _farmers = [];
  List<FarmDetails> get farmers {
    return [..._farmers];
  }

  Future getAllFarmersData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_farm.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_farm.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _farmers = [];
        var extractedData = json.decode(response.body);
        //  print(json.decode(response.body) + 'printed extrated data');
        final List<dynamic> farmDetails = extractedData['farmDetails'];
        for (var i = 0; i < farmDetails.length; i++) {
          _farmers.add(
            FarmDetails(
              id: farmDetails[i]['id'].toString(),
              name: farmDetails[i]['name'].toString(),
              email: farmDetails[i]['email'].toString(),
              phone: farmDetails[i]['phone'].toString(),
              address: farmDetails[i]['address'].toString(),
              farmName: farmDetails[i]['farm_name'].toString(),
              password: farmDetails[i]['password'].toString(),
              file: farmDetails[i]['file'].toString(),
              farmerStatus: farmDetails[i]['farmer_status'].toString()

           

              
            ),
          );
        }
        ;

        print('product details' + _farmers.toString());
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