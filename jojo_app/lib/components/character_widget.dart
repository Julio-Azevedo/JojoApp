import 'package:flutter/material.dart';
import 'package:jojo_app/components/personagem_widget.dart';
import 'package:jojo_app/components/stand_widget.dart';
import 'package:jojo_app/models/personagem.dart';
import 'package:jojo_app/models/stand.dart';
import 'package:jojo_app/services/jojo_service.dart';

class CharacterWidget extends StatelessWidget {
  final int index;
  final Personagem? personagem;
  final Stand? stand;
  final JoJoService jojoService;

  const CharacterWidget(this.index,
      {super.key, this.personagem, this.stand, required this.jojoService});

  Image _selectImage() {
    if (index == 0 && personagem != null) {
      return Image.network(
          'https://jojos-bizarre-api.netlify.app/assets/${personagem!.image}');
    } else if (index == 1 && stand != null) {
      return Image.network(
          'https://jojos-bizarre-api.netlify.app/assets/${stand!.image}');
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
              child: index == 0
                  ? PersonagemWidget(
                      personagem!,
                      jojoService: jojoService,
                    )
                  : StandWidget(
                      stand!,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
