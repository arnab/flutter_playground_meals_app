import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class Category {
  final String id = _uuid.v4();
  final String title;
  final Color color;

  Category({
    required this.title,
    this.color = Colors.orange,
  });

}

final allCategories = [
  Category(
    title: 'Italian',
    color: Colors.purple,
  ),
  Category(
    title: 'Quick & Easy',
    color: Colors.red,
  ),
  Category(
    title: 'Hamburgers',
    color: Colors.orange,
  ),
  Category(
    title: 'German',
    color: Colors.amber,
  ),
  Category(
    title: 'Light & Lovely',
    color: Colors.blue,
  ),
  Category(
    title: 'Exotic',
    color: Colors.green,
  ),
  Category(
    title: 'Breakfast',
    color: Colors.lightBlue,
  ),
  Category(
    title: 'Asian',
    color: Colors.lightGreen,
  ),
  Category(
    title: 'French',
    color: Colors.pink,
  ),
  Category(
    title: 'Summer',
    color: Colors.teal,
  ),
];
