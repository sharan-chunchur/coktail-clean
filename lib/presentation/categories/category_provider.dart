
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/category.dart';

final categoryProvider = Provider((ref){
  List<Category> availableCategories = const[
    Category(
      id: 'c1',
      title: 'Ordinary Drink',
      color: Colors.green,
    ),
    Category(
      id: 'c2',
      title: 'Cocktail',
      color: Colors.lightBlue,
    ),
    Category(
      id: 'c3',
      title: 'Shake',
      color: Colors.orange,
    ),
    Category(
      id: 'c4',
      title: 'Other / Unknown',
      color: Colors.amber,
    ),
    Category(
      id: 'c5',
      title: 'Cocoa',
      color: Colors.red,
    ),
    Category(
      id: 'c6',
      title: 'Shot',
      color: Colors.purple,
    ),
    Category(
      id: 'c7',
      title: 'Coffee / Tea',
      color: Colors.blue,
    ),
    Category(
      id: 'c8',
      title: 'Homemade Liqueur',
      color: Colors.lightGreen,
    ),
    Category(
      id: 'c9',
      title: 'Punch / Party Drink',
      color: Colors.pink,
    ),
    Category(
      id: 'c10',
      title: 'Beer',
      color: Colors.teal,
    ),
    Category(
      id: 'c11',
      title: 'Soft Drink',
      color: Colors.yellowAccent,
    ),
  ];
  return availableCategories;
});
