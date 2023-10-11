
import 'package:cocktail/presentation/drinks_details/drink_details_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dependency_injection.dart';
import '../../../domain/model/drink_details.dart';


abstract class DrinkDetailsState{}

class InitialDrinkDetailsState extends DrinkDetailsState{}

class LoadingDrinkDetailsState extends DrinkDetailsState{}

class LoadedDrinkDetailsState extends DrinkDetailsState{
  DrinkDetail drink;
  LoadedDrinkDetailsState({required this.drink});
}

class ErrorDrinkDetailsState extends DrinkDetailsState{
  int? code;
  String msg;
  ErrorDrinkDetailsState({required this.msg, this.code});
}


///////////

class DrinkDetailsNotifier extends StateNotifier<DrinkDetailsState>{
  DrinkDetailsNotifier(): super(InitialDrinkDetailsState());

  void fetchDrinkDetails(String drinkId) async{
    final DrinkDetailsViewModel _viewModel = instance<DrinkDetailsViewModel>();
    try{
      state = LoadingDrinkDetailsState();
      final drinksListResponse = await _viewModel.fetchDrinkDetails(drinkId);
      drinksListResponse.fold((failure) {
        state = ErrorDrinkDetailsState(msg: failure.message, code: failure.code);
      }, (data) {
        state = LoadedDrinkDetailsState(drink: data);
      });

    }catch(e){
      state = ErrorDrinkDetailsState(msg: e.toString());
    }
  }

}

////////

final drinkDetailsProvider = StateNotifierProvider<DrinkDetailsNotifier, DrinkDetailsState>((ref) => DrinkDetailsNotifier());
