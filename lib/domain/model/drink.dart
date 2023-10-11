
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';


class Drink{
  final String strDrink;
  final String strDrinkThumb;
  final String idDrink;

  const Drink({required this.strDrink, required this.strDrinkThumb, required this.idDrink});

  factory Drink.fromJson(Map<String, dynamic> map) => _$DrinkFromJson(map);

  Map<String, dynamic> toJson()=> _$DrinkToJson(this);

}

Drink _$DrinkFromJson(Map<String, dynamic> json) => Drink(
  strDrink: json['strDrink'] as String,
  strDrinkThumb: json['strDrinkThumb'] as String,
  idDrink: json['idDrink'] as String,
);

Map<String, dynamic> _$DrinkToJson(Drink instance) => <String, dynamic>{
  'strDrink': instance.strDrink,
  'strDrinkThumb': instance.strDrinkThumb,
  'idDrink': instance.idDrink,
};

class BaseResponse{
  final List<dynamic> drinks;

  BaseResponse(this.drinks);

  factory BaseResponse.fromJson(Map<String, dynamic> map) => _$BaseResponseFromJson(map);
  Map<String, dynamic> toJson()=> _$BaseResponseToJson(this);
}

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
 json['drinks'] as List<dynamic>,

);

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) => <String, dynamic>{
  'drinks': instance.drinks,

};