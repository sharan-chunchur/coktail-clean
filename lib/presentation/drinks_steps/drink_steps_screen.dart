import 'package:cocktail/presentation/drinks_details/provider/drinks_details_provider.dart';
import 'package:cocktail/presentation/drinks_steps/drinks_steps_viewmodel.dart';
import 'package:cocktail/presentation/drinkslist/drinks_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/drink_details.dart';


class DrinkStepsScreen extends ConsumerWidget {

  const DrinkStepsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drinkDetailsState = ref.read(drinkDetailsProvider);
    final DrinkDetail? drinkDetail;
    final List<String> steps;
    if (drinkDetailsState is LoadedDrinkDetailsState) {

      drinkDetail = drinkDetailsState.drink;
      steps = DrinkStepsViewModel().getDrinkSteps(drinkDetail);
    } else {
      drinkDetail = null;
      steps = [];
    }
    return Scaffold(
      body: drinkDetail == null
          ? const Center(
              child: Text('unavailable'),
            )
          : Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: Image.network(
                    drinkDetail.strDrinkThumb,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Steps',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        height: 220,
                        child: Scrollbar(
                          thumbVisibility: true,
                          trackVisibility: true,
                          child: ListView.builder(
                            itemCount: steps.length - 1,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Text(
                                  (index + 1).toString(),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                title: Text(steps[index],
                                    style: Theme.of(context).textTheme.bodyMedium),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
