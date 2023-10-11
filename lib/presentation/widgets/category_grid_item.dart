
import 'package:cocktail/presentation/drinkslist/provider/drinks_provider.dart';
import 'package:cocktail/presentation/drinkslist/drinks_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/dependency_injection.dart';
import '../../domain/model/category.dart';
import '../resources/routes_manager.dart';
class CategoryGridItem extends StatelessWidget {
  final Category category;
  const CategoryGridItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child){
        return InkWell(
          onTap:(){
            initDrinkListModule();
             ref.read(drinksProvider.notifier).fetchDrinks(category.title);
            Navigator.pushNamed(context, Routes.drinksListScreenRoute, arguments: category.title);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  category.color.withOpacity(0.5),
                  category.color.withOpacity(0.9)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(category.title, style: Theme.of(context).textTheme.titleLarge,),
          ),
        );
      },
    );
  }
}
