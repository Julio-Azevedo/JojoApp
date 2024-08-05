// widget com detalhes do stand

import 'package:flutter/material.dart';
import 'package:jojo_app/models/stand.dart';

class StandWidget extends StatelessWidget {
  final Stand stand;
  const StandWidget(this.stand, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Nome do Stand
        Text(stand.name,
            style: TextStyle(
              fontSize: 32,
              color: Colors.amber[400],
            )),

        const SizedBox(height: 10),
        // Nome Alternativo
        stand.alternateName != "none"
            ? Text(stand.alternateName,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.amber[800],
                    fontStyle: FontStyle.italic))
            : Container(),

        const SizedBox(height: 5),
        // Nome em Japonês
        Text(stand.japaneseName,
            style: const TextStyle(fontSize: 18, color: Colors.black)),

        const SizedBox(height: 15),
        // Partes
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: stand.chapter
              .map(
                (chapter) => Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Chip(
                    label: Text(chapter),
                    labelStyle: const TextStyle(fontSize: 11),
                    labelPadding: const EdgeInsets.all(1),
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              )
              .toList(),
        ),

        // Grito de Batalha
        Center(
          child: Text(
            '"${stand.battleCry}"',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 38,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),

        const SizedBox(height: 15),

        // Lista de Habilidades
        const Center(child: Text("Abilities", style: TextStyle(fontSize: 18))),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: stand.abilities.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Text(stand.abilities[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
