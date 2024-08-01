import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final int index;

  const CharacterWidget(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Imagem que será colocada
        Expanded(
          flex: 1,
          child: Center(
            child: Image.asset(
              'assets/dummy.png',
              fit: BoxFit.cover,
            ),
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
                child: index == 0 ? Text("Personagens ") : Text("Stands")),
          ),
        ),
      ],
    );
  }
}
