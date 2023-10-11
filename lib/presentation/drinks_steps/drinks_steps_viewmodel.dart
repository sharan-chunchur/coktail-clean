import 'package:cocktail/domain/model/drink_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrinkStepsViewModel{

  List<String> getDrinkSteps(DrinkDetail drinkDetail){
    return drinkDetail.strInstructions!.split('.');
  }
}

class NameNotifier extends StateNotifier<String>{
  NameNotifier(super.state);

  void changeName(String name ){
    state = "asf";
  }


}