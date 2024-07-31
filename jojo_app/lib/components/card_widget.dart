import 'package:flutter/material.dart';

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
      case 'Battle Tendency':
      case 'Stardust Crusaders':
      case 'Diamond is Unbreakable':
      case 'Vento Aureo':
      case 'Stone Ocean':
      case 'Steel Ball Run':
      case 'Jojolion':
      default:
        return 'assets/dummy.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 100,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Container(
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
                      Text(
                        nameTitle,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Wrap(
                        spacing: 4,
                        children: chapters
                            .map(
                              (chapter) => Chip(
                                label: Text('#$chapter'),
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
