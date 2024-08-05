// packages
import 'package:flutter/material.dart';
// models
import 'package:jojo_app/pages/details_page.dart';
//services
import 'package:jojo_app/services/jojo_service.dart';
// components
import 'package:jojo_app/components/card_widget.dart';
import 'package:jojo_app/components/my_appbar.dart';

class ListPage extends StatefulWidget {
  final JoJoService jojoService;
  //Map<String, dynamic>? queryParameters;

  const ListPage({super.key, required this.jojoService});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<dynamic>? _characters;
  String? route;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Obtém o argumento da rota
    final arguments = ModalRoute.of(context)!.settings.name;
    if (arguments != null) {
      setState(() {
        route = arguments;
      });
    }
    _fetchObjets();
  }

  void _fetchObjets() async {
    try {
      final List<dynamic>? characters;
      if (route == "/personagens") {
        // criando lista de personagens
        characters = await widget.jojoService.getAllPersonagens();
      } else if (route == "/stands") {
        // criando lista de stands
        characters = await widget.jojoService.getAllStands();
      } else {
        characters = const [];
      }
      // alterando estado
      setState(() {
        _characters = characters;
      });
    } catch (e) {
      throw Exception('Um erro aconteceu: ${e.toString()}');
    }
  }

  void _changeObjects(Map<String, dynamic> query) async {
    List<dynamic> characters;
    if (route == "/personagens") {
      characters = await widget.jojoService.getPersonagemByQuery(query);
    } else if (route == "/stands") {
      characters = await widget.jojoService.getStandByQuery(query);
    } else {
      characters = const [];
    }

    setState(() {
      _characters = characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        changeObjects: _changeObjects,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemCount: _characters?.length ?? 0,
        itemBuilder: (context, index) {
          var img =
              'https://jojos-bizarre-api.netlify.app/assets/${_characters?[index].image}';
          var name = _characters?[index].name ?? "Not found";
          var chapters = _characters?[index].chapter ?? const [];

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
                      personagem: _characters?[index],
                      jojoService: widget.jojoService,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
