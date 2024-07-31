// Página com detalhes de Personagens/Stands
import 'package:flutter/material.dart';
import 'package:jojo_app/common/models/personagem.dart';
import 'package:jojo_app/models/stand.dart';

class DetailPage extends StatelessWidget {
  final Personagem personagem;
  const DetailPage({super.key, required this.personagem});

  Stand _findStand() {}

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
