import 'package:flutter/material.dart';

class LoginModel {
  final String phone;
  final String password;

  LoginModel({
    required this.phone,
    required this.password,
  });
   factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        phone: json['phone'],
        password: json['password']
    );
      
  }
} 