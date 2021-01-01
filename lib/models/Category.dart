import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    this.color = Colors.red,
    @required this.id,
    @required this.title,
  });
}
