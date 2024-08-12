import 'package:flutter/material.dart';
import 'package:jojo_app/components/personagem_widget.dart';
import 'package:jojo_app/components/stand_widget.dart';
import 'package:jojo_app/models/personagem.dart';
import 'package:jojo_app/services/jojo_service.dart';

class CharacterWidget extends StatelessWidget {
  final dynamic character;
  final JoJoService jojoService;
  const CharacterWidget({
    super.key,
    required this.character,
    required this.jojoService,
  });

  Image _selectImage() {
    if (character != null) {
      return Image.network(
        'https://jojos-bizarre-api.netlify.app/assets/${character!.image}',
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    } else {
      return Image.asset('assets/dummy.png', fit: BoxFit.fitHeight);
    }
  }

  // Para adicionar a capa no Card
  String _identifyPartImage(String chapter) {
    switch (chapter) {
      case 'Phantom Blood':
        return 'assets/part1_cover.png';
      case 'Battle Tendency':
        return 'assets/part2_cover.png';
      case 'Stardust Crusaders':
        return 'assets/part3_cover.png';
      case 'Diamond is Unbreakable':
        return 'assets/part4_cover.png';
      case 'Vento Aureo':
        return 'assets/part5_cover.png';
      case 'Stone Ocean':
        return 'assets/part6_cover.png';
      case 'Steel Ball Run':
        return 'assets/part7_cover.png';
      case 'Jojolion':
        return 'assets/part8_cover.png';
      default:
        return 'assets/dummy.png';
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
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    _identifyPartImage(character.chapter[0]),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: _selectImage(),
            ),
          ),
        ),

        // Informações do personagem
        Expanded(
          flex: 2,
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
      ],
    );
  }
}
