import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String phone;
  final String isWhatsapp;
  final String email;
  final String avatarUrl;

  const User({
    this.id,
    @required this.name,
    @required this.phone,
    @required this.isWhatsapp,
    @required this.email,
    @required this.avatarUrl,
  });
}
