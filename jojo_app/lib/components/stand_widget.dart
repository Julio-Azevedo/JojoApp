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
        Text(
          stand.name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Colors.black,
          ),
        ),

        // Nome Alternativo
        stand.alternateName != "none"
            ? Text(
                stand.alternateName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Georgia',
                  color: Colors.deepPurple,
                ),
              )
            : Container(),

        const SizedBox(height: 5),
        // Nome em Japonês
        Text(
          stand.japaneseName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            fontFamily: 'Georgia',
            color: Colors.blueGrey,
          ),
        ),

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
          child: stand.battleCry != "none"
              ? Text(
                  '"${stand.battleCry}"',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontFamily: 'Courier New',
                    fontStyle: FontStyle.italic,
                  ),
                )
              : null,
        ),

        const SizedBox(height: 10),

        // Lista de Habilidades
        const Center(child: Text("Abilities", style: TextStyle(fontSize: 18))),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: stand.abilities.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 35,
                child: Card(
                  child: Center(
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        Text(
                          ' ${stand.abilities[index]}',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Courier New',
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
