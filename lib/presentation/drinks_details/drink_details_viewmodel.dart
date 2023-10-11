import 'package:cocktail/domain/model/drink_details.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../domain/usecase/drink_details_usecase.dart';

class DrinkDetailsViewModel{

  DrinkDetailUseCase drinkDetailUseCase;

  DrinkDetailsViewModel(this.drinkDetailUseCase);

  Future<Either<Failure, DrinkDetail>> fetchDrinkDetails(String input) async {
    return await drinkDetailUseCase.execute(input);
  }
}