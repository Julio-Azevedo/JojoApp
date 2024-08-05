import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class ClickableCard extends StatelessWidget {
  final String nameTitle;
  final List<String> chapters;
  final String imgUrl;
  final VoidCallback onTap;

  const ClickableCard({
    super.key,
    required this.nameTitle,
    required this.chapters,
    required this.imgUrl,
    required this.onTap,
  });

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

  // Para distinguir a cor do card
  Color _identifyPartBorder(String chapter) {
    switch (chapter) {
      case 'Phantom Blood':
        return Colors.orange;
      case 'Battle Tendency':
        return Colors.pink;
      case 'Stardust Crusaders':
        return Colors.blue;
      case 'Diamond is Unbreakable':
        return Colors.cyan;
      case 'Vento Aureo':
        return Colors.white;
      case 'Stone Ocean':
        return Colors.lime;
      case 'Steel Ball Run':
        return Colors.green;
      case 'Jojolion':
        return Colors.purple;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 125,
      child: Card(
        shadowColor: Colors.black,
        elevation: 8,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: _identifyPartBorder(chapters[0]), // Cor da borda
            width: 2.5, // Largura da borda
          ),
          borderRadius:
              BorderRadius.circular(12.0), // Raio do arredondamento dos cantos
        ),
        clipBehavior: Clip.hardEdge,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                _identifyPartImage(chapters[0]),
              ), // Substitua pela URL da sua imagem
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: InkWell(
            splashColor: Colors.blue,
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StrokeText(
                        text: nameTitle,
                        textStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 5,
                        children: chapters
                            .map(
                              (chapter) => Chip(
                                label: Text(chapter),
                                labelStyle: const TextStyle(fontSize: 11),
                                labelPadding: const EdgeInsets.all(0),
                                visualDensity: VisualDensity.compact,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),

                // Imagem a Direita
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imgUrl,
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.fitHeight,
                    errorBuilder: (_, __, ___) {
                      return Image.asset('assets/dummy.png');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
