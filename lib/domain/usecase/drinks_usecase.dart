
import 'package:cocktail/data/network/failure.dart';
import 'package:cocktail/data/request/request.dart';
import 'package:cocktail/domain/model/drink.dart';
import 'package:cocktail/domain/repository/repository.dart';
import 'package:cocktail/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class DrinkUseCase extends BaseUseCase<String, List<Drink>>{
  Repository _repository;

  DrinkUseCase(this._repository);

  @override
  Future<Either<Failure, List<Drink>>> execute(String input) async{
    return await _repository.fetchDrinksList(DrinksListRequest(input));
  }

}