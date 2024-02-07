import 'package:flutter/material.dart';

class FarmDetails {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String farmName;
  final String password;
  final String file;
  final String farmerStatus;

  FarmDetails(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.farmName,
      required this.password,
      required this.file,
      required this.farmerStatus});

  factory FarmDetails.fromJson(Map<String, dynamic> json) {
    return FarmDetails(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        farmName: json['farm_name'],
        password: json['password'],
        file: json['file'],
        farmerStatus: json['farmer_status']);
  }
}
