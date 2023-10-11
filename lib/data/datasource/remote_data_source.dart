import 'package:cocktail/data/network/failure.dart';
import 'package:cocktail/data/request/request.dart';
import 'package:cocktail/data/response/response.dart';
import 'package:dartz/dartz.dart';

import '../network/app_api.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, List<DrinksResponse>>> fetchDrinksList(
      DrinksListRequest drinksListRequest);

  Future<Either<Failure, DrinkDetailsListResponse>> fetchDrinkDetails(
      DrinkDetailsRequest drinkDetailsRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<Either<Failure, DrinkDetailsListResponse>> fetchDrinkDetails(
      DrinkDetailsRequest drinkDetailsRequest) async {
    final result = await _appServiceClient
        .fetchDrinkDetails(drinkDetailsRequest.drinkId);

    return result;
  }

  @override
  Future<Either<Failure, List<DrinksResponse>>> fetchDrinksList(
      DrinksListRequest drinksListRequest) async {
    return await _appServiceClient.fetchDrink(drinksListRequest.categoryName);
  }
}
