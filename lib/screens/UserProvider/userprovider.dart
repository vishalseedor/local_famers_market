import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:local_farmers_project/screens/UserProvider/usermodel.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  late UserData _userData;

  UserData get userData => _userData;

  Future<void> fetchUserData({required userid}) async {
    final response = await http.get(Uri.parse('http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/view_user.php?userid=$userid'));

    if (response.statusCode == 200) {
      _userData = UserData.fromJson(jsonDecode(response.body));
      notifyListeners();
    } else {
      throw Exception('Failed to load user data');
    }
  }
}