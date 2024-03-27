import 'package:flutter/material.dart';

class CartDetails {
  final String cartId;
  final String productId;
  final String image;
  final String productName;
  final String price;
   String quantity;
  final String itemTotal;


  CartDetails(
      {required this.cartId,
      required this.productId,
      required this.image,
      required this.productName,
      required this.price,
      required this.quantity,
      required this.itemTotal,
      }); 

 factory CartDetails.fromJson(Map<String, dynamic> json) {
   return CartDetails(
    cartId: json['cart_id'],
     productId:json['product_id'],
      image: json['image'],
       productName:json['product_name'],
        price:json['price'],
         quantity:json['quantity'],
          itemTotal: json['item_total'],
       
          );

  }}