import 'package:flutter/material.dart';

// Model class to represent user data
class AddCartItem {
  final int productId;
  final int userId;
  final int quantity;

  AddCartItem({required this.productId, required this.userId, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'user_id': userId,
      'quantity': quantity,
    };
  }
}