class ApiConst {
  static const CHARACTER_URL =
      "https://stand-by-me.herokuapp.com/api/v1/characters";
  static const STAND_URL = "https://stand-by-me.herokuapp.com/api/v1/stands";

  const ApiConst();

  get getCharacterUrl {
    return CHARACTER_URL;
  }

  get getStandUrl {
    return STAND_URL;
  }

  String tranformInQuery(String URL) {
    return "$URL/query/query?";
  }
}
