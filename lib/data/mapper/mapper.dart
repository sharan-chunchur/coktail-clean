import 'package:cocktail/application/extensions.dart';

import '../../domain/model/drink.dart';
import '../../domain/model/drink_details.dart';
import '../response/response.dart';

extension DrinksResponseMapper on DrinksResponse? {
  Drink toDomain() {
    return Drink(
      strDrink: this!.strDrink.orEmpty(),
      strDrinkThumb: this!.strDrinkThumb.orEmpty(),
      idDrink: this!.idDrink.orEmpty(),
    );
  }
}

extension DrinkDetailResponseMapper on DrinkDetailResponse? {
  DrinkDetail toDomain() {
    final List<String> ingredients = [];
    final List<String?> measures = [];

    final drinkJson = this?.toJson();

    for (int i = 1;; i++) {
      if (drinkJson!.containsKey('strIngredient$i') &&
          drinkJson['strIngredient$i'] != null) {
        ingredients.add(drinkJson['strIngredient$i']);
      } else {
        break;
      }
    }

    for (int i = 1; i<= ingredients.length; i++) {
        measures.add(drinkJson['strMeasure$i']);
    }

    return DrinkDetail(
        idDrink: this!.idDrink.orEmpty(),
        strDrink: this!.strDrink.orEmpty(),
        strVideo: this!.strVideo.orEmpty(),
        strCategory: this!.strCategory.orEmpty(),
        strInstructions: this!.strInstructions.orEmpty(),
        strInstructionsES: this!.strInstructionsES.orEmpty(),
        strInstructionsDE: this!.strInstructionsDE.orEmpty(),
        strInstructionsFR: this!.strInstructionsFR.orEmpty(),
        strInstructionsIT: this!.strInstructionsIT.orEmpty(),
        strDrinkThumb: this!.strDrinkThumb.orEmpty(),
        strIngredients: ingredients,
        strMeasures: measures,
        dateModified: this!.dateModified.orEmpty());
  }
}


