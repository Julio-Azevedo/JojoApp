// Página com a Lista de Personagens/Stands e Filtro

// packages
import 'package:flutter/material.dart';
import 'package:jojo_app/components/card_widget.dart';

// models
import 'package:jojo_app/models/personagem.dart';
import 'package:jojo_app/pages/details_page.dart';

//services
import 'package:jojo_app/services/jojo_service.dart';

class ListPage extends StatefulWidget {
  final JoJoService jojoService;
  //Map<String, dynamic>? queryParameters;

  const ListPage({super.key, required this.jojoService});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Personagem>? _personagens;

  @override
  void initState() {
    super.initState();

    // atualizando lista inicial
    _fetchObjects();
  }

  _fetchObjects() async {
    // atualizar personagens e stands
    try {
      // criando lista de personagens
      final personagens = await widget.jojoService.getAllPersonagens();
      // alterando estado
      setState(() {
        _personagens = personagens;
      });
    } catch (e) {
      throw Exception('Um erro aconteceu: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      itemCount: _personagens?.length ?? 0,
      itemBuilder: (context, index) {
        var img =
            'https://jojos-bizarre-api.netlify.app/assets/${_personagens?[index].image}';
        var name = _personagens?[index].name ?? "Not found";
        var chapters = _personagens?[index].chapter ?? const [];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: ClickableCard(
            nameTitle: name,
            chapters: chapters,
            imgUrl: img,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    personagem: _personagens?[index],
                    jojoService: widget.jojoService,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
