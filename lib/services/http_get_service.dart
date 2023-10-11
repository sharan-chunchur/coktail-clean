// import 'dart:convert';
//
//
// import 'package:dio/dio.dart';
//
// import '../domain/model/drink.dart';
// import '../domain/model/drink_details.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:http/http.dart' as http;
//
//
//
// class HttpGetServices {
//
//   static const baseUrl = 'www.thecocktaildb.com';
//   final _dio = Dio();
//
//   Future<List<Drink>> getDrinksLists(String categoryType) async {
//     String endPoint = 'api/json/v1/1/filter.php';
//     List<Drink> drinks = [];
//     try {
//       Uri uri = Uri.https(baseUrl, endPoint, {'c':categoryType});
//       _dio.interceptors.add(LogInterceptor(request: true,
//         requestHeader: true,
//         requestBody: true,
//         responseHeader: true,
//         responseBody: true,
//         error: true,));
//       final response = await _dio.getUri(uri);
//
//       if (response.statusCode == 200) {
//         var drinksList = BaseResponse.fromJson(response.data);
//         for (var drink in drinksList.drinks) {
//           var drinkData = Drink.fromJson(drink);
//           drinks.add(drinkData);
//         }
//       }
//     } catch (e) {
//       print(e.toString());
//       //  rethrow;
//     }
//     return drinks;
//   }
//
//   Future<List<DrinkDetail>> getDrinkDetails(String drinkId) async {
//     String endPoint = 'api/json/v1/1/lookup.php';
//     List<DrinkDetail> drinksDetails = [];
//
//     try {
//       Uri uri = Uri.https(baseUrl, endPoint, {'i':drinkId});
//       // _dio.interceptors.add(LogInterceptor(request: true,
//       //   requestHeader: true,
//       //   requestBody: true,
//       //   responseHeader: true,
//       //   responseBody: true,
//       //   error: true,));
//       final response = await _dio.getUri(uri);
//
//       if (response.statusCode == 200) {
//         var drinksDetailsList = DrinkDetailsResponse.fromJson(response.data);
//
//         for (var drinkDetail in drinksDetailsList.drinks) {
//           drinksDetails.add(drinkDetail);
//         }
//       }
//     } catch (e) {
//       rethrow;
//       //  rethrow;
//     }
//     return drinksDetails;
//   }
// }