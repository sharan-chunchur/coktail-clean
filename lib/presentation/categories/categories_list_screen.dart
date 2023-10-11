import 'package:cocktail/presentation/categories/category_provider.dart';
import 'package:cocktail/services/http_get_service.dart';
import 'package:cocktail/presentation/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesListPage extends ConsumerWidget {
  const CategoriesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.read(categoryProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 4/ 3),itemCount:categories.length , itemBuilder:(context, index){
          return CategoryGridItem(category: categories[index],);
        } ),
      ),
    );
  }
}
