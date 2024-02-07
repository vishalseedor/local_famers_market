import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final String quantity;
  final String farmerid;
 
 CategoryModel({
      required this.id,
      required this.name,
      required this.quantity,
      required this.farmerid,
    });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'],
        name: json['name'],
        quantity: json['quantity'],
        farmerid: json['farmer_id']
       );
  }
}
