import 'dart:io';

import 'package:cocktail/application/constants.dart';
import 'package:cocktail/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


import '../response/response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient{
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("/api/json/v1/1/filter.php")
  Future<Either<Failure, List<DrinksResponse>>> fetchDrink(
      @Query("c") String categoryType
      );

  @GET("/api/json/v1/1/lookup.php")
  Future<Either<Failure, DrinkDetailsListResponse>> fetchDrinkDetails(
      @Query("i") String drinkId
      );
}