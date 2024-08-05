import 'package:flutter/material.dart';
import 'package:jojo_app/components/icon_link_widget.dart';
import 'package:jojo_app/models/personagem.dart';
import 'package:jojo_app/services/jojo_service.dart';

class PersonagemWidget extends StatelessWidget {
  final Personagem personagem;
  final JoJoService jojoService;
  const PersonagemWidget(
    this.personagem, {
    super.key,
    required this.jojoService,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Nome
        Text(
          personagem.name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 5),

        // Nome em Japonês
        Text(
          personagem.japaneseName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            fontFamily: 'Georgia',
            color: Colors.blueGrey,
          ),
        ),

        const SizedBox(height: 5),

        // Partes
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
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
        ),

        const SizedBox(height: 15),
        // Frase de Efeito
        Center(
          child: Text(
            '"${personagem.catchPhrase}"',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
              fontFamily: 'Courier New',
              fontStyle: FontStyle.italic,
            ),
          ),
        ),

        // Família (Link para segui-los)

        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: personagem.family[0] != "none"
                ? personagem.family
                    .map(
                      (familyMember) =>
                          IconLink(familyMember, jojoService: jojoService),
                    )
                    .toList()
                : const [],
          ),
        ),
      ],
    );
  }
}
