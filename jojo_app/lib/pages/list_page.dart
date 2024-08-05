// packages
import 'package:flutter/material.dart';
import 'package:jojo_app/components/my_drawer.dart';
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
  String? _route;
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_characters == null) {
      // Obtém a rota
      final route = ModalRoute.of(context)!.settings.name;
      // Obtém o argumento
      final argument = ModalRoute.of(context)!.settings.arguments;
      // Muda a rota do objeto
      _route = route;
      // Verifica se há argumento
      if (argument != null) {
        Map<String, dynamic> newQuery = {
          'chapter': argument,
        };

        _changeObjects(newQuery);
      } else {
        _fetchObjets();
      }
    }
  }

  void _fetchObjets() async {
    try {
      final List<dynamic>? characters;
      if (_route == "/personagens") {
        // criando lista de personagens
        characters = await widget.jojoService.getAllPersonagens();
      } else if (_route == "/stands") {
        // criando lista de stands
        characters = await widget.jojoService.getAllStands();
      } else {
        characters = const [];
      }
      // alterando estado
      if (mounted) {
        setState(() {
          _characters = characters;
          _isLoading = false;
        });
      }
    } catch (e) {
      throw Exception('Um erro aconteceu: ${e.toString()}');
    }
  }

  void _changeObjects(Map<String, dynamic> query) async {
    try {
      List<dynamic> characters;
      if (_route == "/personagens") {
        characters = await widget.jojoService.getPersonagemByQuery(query);
      } else if (_route == "/stands") {
        characters = await widget.jojoService.getStandByQuery(query);
      } else {
        characters = const [];
      }

      if (mounted) {
        setState(() {
          _characters = characters;
          _isLoading = false;
        });
      }
    } catch (e) {
      throw Exception('Um erro aconteceu: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        changeObjects: _changeObjects,
      ),
      drawer: const MyDrawer(),
      body: _characters == null
          ? const Center(child: CircularProgressIndicator())
          : _characters!.isEmpty
              ? const Center(
                  child: Text(
                      "Não foram encontrados personagens para essa especificação. "),
                )
              : _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
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
                                    character: _characters?[index],
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
