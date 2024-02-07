import 'package:flutter/material.dart';

class ProductDetails {
  final String productId;
  final String productName;
  final String quantity;
  final String description;
  final String additionalInformation;
  final String price;
  final String category;
  final String farmer;
  final String categoryId;
  final String image;

  ProductDetails(
      { required this.productId,
     required this.productName,
     required this.quantity,
     required this.description,
     required this.additionalInformation,
     required this.price,
     required this.category,
     required this.farmer,
     required this.categoryId,
     required this.image
     });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
    productId: json['product_id'],
    productName:json['product_name'],
    quantity:json['quantity'],
    description: json['description'],
    additionalInformation: json['additional_information'],
    price:json['price'], 
    category:json['category'],
    farmer: json['farmer'], 
    categoryId:json['category_id'],
    image: json['image']
    );
   
  }}