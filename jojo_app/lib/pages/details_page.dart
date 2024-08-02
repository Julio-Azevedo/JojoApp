import 'package:flutter/material.dart';
import 'package:jojo_app/components/character_widget.dart';
import 'package:jojo_app/models/personagem.dart';
import 'package:jojo_app/models/stand.dart';
import 'package:jojo_app/services/jojo_service.dart';

class DetailsPage extends StatefulWidget {
  final JoJoService jojoService;
  final Personagem? personagem;
  final Stand? stand;

  const DetailsPage({
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

  int _selectedIndex = 0;
  bool _isLoading = true;

  @override
  initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    // Inicia em Personagem
    int newIndex = 0;

    Personagem? fetchedPersonagem;
    if (widget.personagem != null) {
      fetchedPersonagem = widget.personagem;
    } else {
      fetchedPersonagem = await _findUser();
    }

    Stand? fetchedStand;
    if (widget.stand != null) {
      // Se altera em Stand
      newIndex = 1;
      fetchedStand = widget.stand;
    } else {
      fetchedStand = await _findStand();
    }

    setState(() {
      _stand = fetchedStand;
      _personagem = fetchedPersonagem;
      _selectedIndex = newIndex;
      _isLoading = false;
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool bottomImpossible = false;
    List<BottomNavigationBarItem> bottomNavItems = [];

    if (_personagem != null) {
      bottomNavItems.add(
        const BottomNavigationBarItem(
          icon: Icon(Icons.fingerprint),
          label: "Personagem",
        ),
      );
    } else {
      bottomImpossible = true;
    }

    if (_stand != null) {
      bottomNavItems.add(
        const BottomNavigationBarItem(
          icon: Icon(Icons.psychology),
          label: "Stand",
        ),
      );
    } else {
      bottomImpossible = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Personagens'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : CharacterWidget(
              _selectedIndex,
              personagem: _personagem,
              stand: _stand,
              jojoService: widget.jojoService,
            ),
      bottomNavigationBar: _isLoading
          ? null
          : bottomImpossible
              ? null
              : BottomNavigationBar(
                  selectedItemColor: Colors.blue[600],
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                  items: bottomNavItems,
                ),
    );
  }
}
