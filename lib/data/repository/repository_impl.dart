import 'package:cocktail/data/mapper/mapper.dart';
import 'package:cocktail/data/network/failure.dart';
import 'package:cocktail/data/request/request.dart';
import 'package:dartz/dartz.dart';

import '../../domain/model/drink.dart';
import '../../domain/model/drink_details.dart';
import '../../domain/repository/repository.dart';
import '../datasource/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, DrinkDetail>> fetchDrinkDetails(
      DrinkDetailsRequest drinkDetailsRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        // safe to call the API
        final response =
        await _remoteDataSource.fetchDrinkDetails(drinkDetailsRequest);
        return response.fold((failure) {
          return Left(failure);
        }, (data) {
          return Right(data.drinks![0].toDomain());
        });
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Drink>>> fetchDrinksList(
      DrinksListRequest drinksListRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        // safe to call the API
        final response =
            await _remoteDataSource.fetchDrinksList(drinksListRequest);
        return response.fold((failure) {
          return Left(failure);
        }, (data) {
          return Right(data.map((drinkResponse) => drinkResponse.toDomain()).toList());
        });
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
