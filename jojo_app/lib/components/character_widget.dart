import 'package:flutter/material.dart';
import 'package:jojo_app/components/personagem_widget.dart';
import 'package:jojo_app/components/stand_widget.dart';
import 'package:jojo_app/models/personagem.dart';
import 'package:jojo_app/services/jojo_service.dart';

class CharacterWidget extends StatelessWidget {
  final dynamic character;
  final JoJoService jojoService;

  const CharacterWidget(
      {super.key, required this.character, required this.jojoService});

  Image _selectImage() {
    if (character != null) {
      return Image.network(
          'https://jojos-bizarre-api.netlify.app/assets/${character!.image}');
    } else {
      return Image.asset('assets/dummy.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Imagem que será colocada
        Expanded(
          flex: 1,
          child: Center(
            // Colocar uma imagem de fundo de acordo com a parte
            child: _selectImage(),
          ),
        ),

        // Informações do personagem
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,
                width: 3.0,
              ),
            ),
            child: Center(
              child: character is Personagem
                  ? PersonagemWidget(
                      character!,
                      jojoService: jojoService,
                    )
                  : StandWidget(
                      character!,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
