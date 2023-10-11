import 'package:cocktail/presentation/drinkslist/drinks_view_model.dart';
import 'package:cocktail/services/http_get_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dependency_injection.dart';
import '../../../data/network/app_api.dart';
import '../../../data/network/dio_factory.dart';
import '../../../domain/model/drink.dart';

abstract class DrinksState {}

class InitialDrinksState extends DrinksState {}

class LoadingDrinksState extends DrinksState {}

class LoadedDrinksState extends DrinksState {
  List<Drink> drinks;

  LoadedDrinksState({required this.drinks});
}

class ErrorState extends DrinksState {
  int? code;
  String msg;

  ErrorState({required this.code, required this.msg});
}

class DrinkNotifier extends StateNotifier<DrinksState> {
  DrinkNotifier() : super(InitialDrinksState());

  void fetchDrinks(String categoryType) async {
    final DrinksViewModel _viewModel = instance<DrinksViewModel>();
    try {
      state = LoadingDrinksState();
      final drinksListResponse = await _viewModel.fetchDrinksList(categoryType);
      drinksListResponse.fold((failure) {
        state = ErrorState(msg: failure.message, code: failure.code);
      }, (drinksLst) {
        drinksLst.map((drinkItem) => print(drinkItem.idDrink));
        state = LoadedDrinksState(drinks: drinksLst);
      });
    } catch (e) {
      print("ERROR ---------> $e");
      state = ErrorState(msg: e.toString(), code: null);
    }
  }
}

final drinksProvider =
    StateNotifierProvider<DrinkNotifier, DrinksState>((ref) => DrinkNotifier());
