
import 'package:cocktail/presentation/common/erro_screen.dart';
import 'package:cocktail/presentation/drinkslist/provider/drinks_provider.dart';
import 'package:cocktail/presentation/widgets/drink_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../resources/assets_manager.dart';
import '../widgets/error_display.dart';

class DrinksListScreen extends StatelessWidget {
  final String title;
  const DrinksListScreen({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final drinksState = ref.watch(drinksProvider);
          if(drinksState is LoadedDrinksState){
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2 / 3),
                itemCount: drinksState.drinks.length,
                itemBuilder: (context, index) {
                  return DrinkItem(drinkItem: drinksState.drinks[index],);
                });
          }else if(drinksState is ErrorState){
            print("ERROR CHECK ${drinksState.msg}");
            return ErrorDisplay(errTitle: drinksState.msg, title: title, onRetry: (){
              ref.read(drinksProvider.notifier).fetchDrinks(title);
              },);
          }
          else {
            return Center(child: Lottie.asset(JsonAssets.loading),);
          }
        },
      ),
    );
  }
}
