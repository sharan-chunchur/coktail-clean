


import 'package:cocktail/domain/model/drink_details.dart';
import 'package:dartz/dartz.dart';
import 'package:cocktail/domain/model/drink.dart';

import '../../data/network/failure.dart';
import '../../data/request/request.dart';

abstract class Repository{
  Future<Either<Failure,List<Drink>>> fetchDrinksList(DrinksListRequest drinksListRequest);

  Future<Either<Failure,DrinkDetail>> fetchDrinkDetails(DrinkDetailsRequest drinkDetailsRequest);
}


