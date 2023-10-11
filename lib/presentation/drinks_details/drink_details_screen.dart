
import 'package:cocktail/presentation/drinks_details/provider/drinks_details_provider.dart';
import 'package:cocktail/presentation/resources/assets_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../domain/model/drink_details.dart';
import '../resources/routes_manager.dart';
import '../widgets/error_display.dart';

class DrinkDetailsScreen extends ConsumerWidget {

  final String drinkId;

  const DrinkDetailsScreen({super.key, required this.drinkId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drinkDetailsState = ref.watch(drinkDetailsProvider);
    Widget content;
    if (drinkDetailsState is ErrorDrinkDetailsState) {

      content = ErrorDisplay(errTitle: drinkDetailsState.msg, title: drinkId,onRetry: (){ref.read(drinkDetailsProvider.notifier).fetchDrinkDetails(drinkId);},);
    } else if (drinkDetailsState is LoadedDrinkDetailsState) {
      final DrinkDetail drinkDetail = drinkDetailsState.drink;
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 350,
            child: Stack(
              children: [
                FadeInImage(
                  fit: BoxFit.fill,
                  width: double.infinity,
                  placeholder: const AssetImage(ImageAssets.placeholder, ),
                  image: NetworkImage(
                    drinkDetail.strDrinkThumb,),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.black45,
                    child: Text(
                      drinkDetail.strDrink,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
                const Positioned(
                  top: 0,
                  child: Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 40),
                      child: Icon(
                        Icons.circle,
                        size: 32,
                        color: Colors.white,
                      )),
                ),
                 Positioned(
                  top: 0,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 40),
                        child: Icon(
                          Icons.cancel,
                          size: 32,
                          color: Colors.grey,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(40,24,40,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    child: ListView.builder(
                        itemCount: drinkDetail.strIngredients.length,
                        itemBuilder: (context, index) {
                          return Text(
                            drinkDetail.strMeasures[index] == null ? drinkDetail.strIngredients[index] : "${drinkDetail.strMeasures[index]} ${drinkDetail.strIngredients[index]}",
                              style: Theme.of(context).textTheme.bodyMedium);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      print("CHECK 2");
      content = Center(
        child: Lottie.asset(JsonAssets.loading),
      );
    }
    return Scaffold(
      body: content,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: drinkDetailsState is LoadedDrinkDetailsState
          ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.drinkStepsScreenRoute);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade800,
                    foregroundColor: Colors.white),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 8),
                  child: Text(
                    'Start mixing',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
          ) :const SizedBox.shrink()
    );
  }
}
