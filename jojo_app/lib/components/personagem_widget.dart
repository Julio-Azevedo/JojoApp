import 'package:flutter/material.dart';
import 'package:jojo_app/components/icon_link_widget.dart';
import 'package:jojo_app/models/personagem.dart';
import 'package:jojo_app/services/jojo_service.dart';

class PersonagemWidget extends StatelessWidget {
  final Personagem personagem;
  final JoJoService jojoService;
  const PersonagemWidget(
      {super.key, required this.personagem, required this.jojoService});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Nome
          Text(personagem.name,
              style: const TextStyle(fontSize: 32, color: Colors.purple)),

          const SizedBox(height: 5),
          // Nome em Japonês
          Text(personagem.japaneseName,
              style: const TextStyle(fontSize: 18, color: Colors.black)),

          const SizedBox(height: 5),
          // Partes

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: personagem.chapter
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

          const SizedBox(height: 25),
          // Frase de Efeito
          Center(
            child: Text('"${personagem.catchPhrase}"',
                style: const TextStyle(
                  fontSize: 46,
                  fontStyle: FontStyle.italic,
                )),
          ),

          const SizedBox(height: 15),
          // Família (Link para segui-los)
          const Center(
              child: Text("Family Members", style: TextStyle(fontSize: 18))),

          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: personagem.family
                  .map((familyMember) =>
                      IconLink(familyMember, jojoService: jojoService))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
