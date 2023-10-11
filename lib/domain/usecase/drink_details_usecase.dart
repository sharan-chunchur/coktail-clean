
import 'package:cocktail/data/network/failure.dart';
import 'package:cocktail/data/request/request.dart';
import 'package:cocktail/domain/model/drink.dart';
import 'package:cocktail/domain/repository/repository.dart';
import 'package:cocktail/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../data/mapper/mapper.dart';
import '../model/drink_details.dart';

class DrinkDetailUseCase extends BaseUseCase<String, DrinkDetail>{
  Repository _repository;

  DrinkDetailUseCase(this._repository);

  @override
  Future<Either<Failure, DrinkDetail>> execute(String input) async{
    return await _repository.fetchDrinkDetails(DrinkDetailsRequest(input));
  }
}