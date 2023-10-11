
import 'package:flutter/material.dart';

class ColorManager{
  static Color primary = HexColor.fromHex('#698587');
  static Color darkGrey = HexColor.fromHex('#5C5C52'); //
  static Color grey = HexColor.fromHex('#737477');
  static Color lightGrey = HexColor.fromHex('#BDB6AF'); //
  static Color primaryOpacity70 = HexColor.fromHex('#B3ED9728');
  static Color brown = HexColor.fromHex('#644D2C');//
  static Color lightbrown = HexColor.fromHex('#BC985D');//
  static Color darkbrown = HexColor.fromHex('#AF6026');//


  // new colors
  static Color darkPrimary = HexColor.fromHex("#040404"); //
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black= HexColor.fromHex("#000000");
}


extension HexColor on Color{
  static fromHex(String hexColorString){
    hexColorString =hexColorString.replaceAll('#', '');
    if(hexColorString.length == 6){
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}