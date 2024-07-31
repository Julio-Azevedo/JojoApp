import 'package:flutter/material.dart';
import 'package:jojo_app/models/personagem.dart';
import 'package:jojo_app/models/stand.dart';
import 'package:jojo_app/services/jojo_service.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  final JoJoService jojoService;
  Personagem? personagem;
  Stand? stand;

  DetailsPage({
    super.key,
    this.personagem,
    this.stand,
    required this.jojoService,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Stand? _stand;
  Personagem? _personagem;

  @override
  initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    Personagem? fetchedPersonagem;
    if (widget.personagem != null) {
      fetchedPersonagem = widget.personagem;
    } else {
      fetchedPersonagem = await _findUser();
    }

    Stand? fetchedStand;
    if (widget.stand != null) {
      fetchedStand = widget.stand;
    } else {
      fetchedStand = await _findStand();
    }

    setState(() {
      _stand = fetchedStand;
      _personagem = fetchedPersonagem;
    });
  }

  Future<Stand?> _findStand() async {
    var query = {'standUser': '${widget.personagem?.id}'};
    // encontrando stands
    List<Stand> standVerify = await widget.jojoService.getStandByQuery(query);
    // retornando o stand ou nulo
    return standVerify.isNotEmpty ? standVerify[0] : null;
  }

  Future<Personagem?> _findUser() async {
    // construindo uma query para encontrar o Usuário do stand
    var id = widget.stand?.standUser;
    // Encontrando o usuário
    Personagem? userVerify = await widget.jojoService.getPersonagem(id!);
    // Retornando o usuário
    return userVerify;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Personagens'),
      ),
      body: Text('User: ${_personagem?.name}, Stand: ${_stand?.name}'),
    );
  }
}
