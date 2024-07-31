class ApiConst {
  static const BASE_URL = "https://stand-by-me.herokuapp.com";
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

  get getBaseUrl {
    return BASE_URL;
  }
}
