import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:jojo_app/common/consts/api_consts.dart';
import 'package:jojo_app/common/error/failure.dart';
import 'package:jojo_app/common/models/personagem.dart';

abstract class IJojoRepository {
  Future<List<Personagem>> getAllPersonagens();
}

class JojoRepository implements IJojoRepository {
  final Dio dio;
  JojoRepository({required this.dio});

  @override
  Future<List<Personagem>> getAllPersonagens() async {
    try {
      final response = await dio.get(ApiConsts.jojoapiURL);
      
      // Verificando o tipo de response.data e convertendo conforme necessário
      if (response.data is String) {
        final List<dynamic> json = jsonDecode(response.data) as List<dynamic>;
        final List<Personagem> personagens = json.map((e) => Personagem.fromMap(e as Map<String, dynamic>)).toList();
        return personagens;
      } else if (response.data is List) {
        final List<dynamic> json = response.data as List<dynamic>;
        final List<Personagem> personagens = json.map((e) => Personagem.fromMap(e as Map<String, dynamic>)).toList();
        return personagens;
      } else {
        throw Failure(message: 'Formato de resposta inesperado');
      }
    } catch (e) {
      // Adicionando mensagem de depuração para verificar o erro
      print('Erro: $e');
      throw Failure(message: 'Não foi possível carregar os dados');
    }
  }
}