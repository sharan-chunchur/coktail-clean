

class DrinkDetail {
  String idDrink;
  String strDrink;
  String? strVideo;
  String strCategory;
  String? strInstructions;
  String? strInstructionsES;
  String? strInstructionsDE;
  String? strInstructionsFR;
  String? strInstructionsIT;
  String strDrinkThumb;
  List<String> strIngredients;
  List<String?> strMeasures;
  String? dateModified;

  DrinkDetail(
      {required this.idDrink,
        required this.strDrink,
        required this.strVideo,
        required this.strCategory,
        required this.strInstructions,
        required this.strInstructionsES,
        required this.strInstructionsDE,
        required this.strInstructionsFR,
        required this.strInstructionsIT,
        required this.strDrinkThumb,
        required this.strIngredients,
        required this.strMeasures,
        required this.dateModified});
}
