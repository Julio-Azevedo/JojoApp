// packages
import 'dart:convert';
import 'package:http/http.dart' as http;
// models
import 'package:jojo_app/models/personagem.dart';
import 'package:jojo_app/models/api_const.dart';
import 'package:jojo_app/models/stand.dart';

class JoJoService {
  final ApiConst apiUrl;
  JoJoService({this.apiUrl = const ApiConst()});

  Future<Personagem> getPersonagem(int id) async {
    String url = '${apiUrl.getCharacterUrl}/$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Personagem.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get Personagem data');
    }
  }

  Future<List<Personagem>> getAllPersonagens() async {
    String url = '${apiUrl.getCharacterUrl}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<Personagem> personagens =
          jsonList.map((json) => Personagem.fromJson(json)).toList();

      return personagens;
    } else {
      throw Exception('Failed to get List of Personagem data');
    }
  }

  Future<Stand> getStand(int id) async {
    String url = '${apiUrl.getStandUrl}/$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        return Stand.fromJson(jsonDecode(response.body));
      } catch (e) {
        throw Exception('Failed to parse Stand data: $e');
      }
    } else {
      throw Exception('Failed to get Stand data');
    }
  }

  Future<List<Stand>> getAllStands() async {
    String url = '${apiUrl.getStandUrl}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<Stand> stands =
          jsonList.map((json) => Stand.fromJson(json)).toList();
      print(stands);

      return stands;
    } else {
      throw Exception('Failed to get List of Stand data');
    }
  }
}
