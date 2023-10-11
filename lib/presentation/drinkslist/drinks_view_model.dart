import 'package:cocktail/domain/usecase/drinks_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/network/failure.dart';
import '../../domain/model/drink.dart';

class DrinksViewModel{

  DrinkUseCase drinkUseCase;

  DrinksViewModel(this.drinkUseCase);

  Future<Either<Failure, List<Drink>>> fetchDrinksList(String input) async {
    return await drinkUseCase.execute(input);
  }
}
