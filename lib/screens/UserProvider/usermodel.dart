import 'package:flutter/material.dart';

class UserData {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String image;
  final String address;
  final String state;
  final String userType;
  final String creationAt;

  UserData(
      {required this.id, 
      required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.image,
      required this.address,
      required this.state,
      required this.userType,
      required this.creationAt});

 factory UserData.fromJson(Map<String, dynamic> json) {
  return UserData(
    id: json['id'],
     name: json['name'], 
     phone:json['phone'], 
     email: json['email'],
     password: json['password'],
      image: json['image'], 
      address: json['address'],
       state: json['state'],
        userType: json['user_type'],
       creationAt: json['creation_at']);
   
  }}