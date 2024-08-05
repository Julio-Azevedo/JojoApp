import 'package:flutter/material.dart';
import 'package:jojo_app/components/character_widget.dart';
import 'package:jojo_app/models/personagem.dart';
import 'package:jojo_app/models/stand.dart';
import 'package:jojo_app/services/jojo_service.dart';

enum selected { personagem, stand, standby }

class DetailsPage extends StatefulWidget {
  final JoJoService jojoService;
  final dynamic character;

  const DetailsPage({
    super.key,
    this.character,
    required this.jojoService,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Stand? _stand;
  Personagem? _personagem;

  selected _selectedCharacter = selected.standby;
  bool _isLoading = true;

  @override
  initState() {
    super.initState();

    _loadData();
  }

  void _loadData() async {
    // Inicia em Personagem
    selected fetchedSelected = selected.standby;

    Personagem? fetchedPersonagem;
    if (widget.character is Personagem && widget.character != null) {
      fetchedPersonagem = widget.character;
      fetchedSelected = selected.personagem;
    } else {
      fetchedPersonagem = await _findUser();
    }

    Stand? fetchedStand;
    if (widget.character is Stand && widget.character != null) {
      fetchedStand = widget.character;
      fetchedSelected = selected.stand;
    } else {
      fetchedStand = await _findStand();
    }

    setState(() {
      _stand = fetchedStand;
      _personagem = fetchedPersonagem;
      _selectedCharacter = fetchedSelected;
      _isLoading = false;
    });
  }

  Future<Stand?> _findStand() async {
    var query = {'standUser': '${widget.character.id}'};
    // encontrando stands
    List<Stand> standVerify = await widget.jojoService.getStandByQuery(query);
    // retornando o stand ou nulo
    return standVerify.isNotEmpty ? standVerify[0] : null;
  }

  Future<Personagem?> _findUser() async {
    // construindo uma query para encontrar o Usuário do stand
    var id = widget.character.standUser;
    // Encontrando o usuário
    Personagem? userVerify = await widget.jojoService.getPersonagem(id!);
    // Retornando o usuário
    return userVerify;
  }

  void _onItemTapped(int index) {
    selected selectedCharacter =
        index == 0 ? selected.personagem : selected.stand;

    setState(() {
      _selectedCharacter = selectedCharacter;
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
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Lista de Personagens'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : CharacterWidget(
              character: _selectedCharacter == selected.personagem
                  ? _personagem
                  : _stand,
              jojoService: widget.jojoService,
            ),
      bottomNavigationBar: _isLoading
          ? null
          : bottomImpossible
              ? null
              : BottomNavigationBar(
                  selectedItemColor: Colors.blue[600],
                  currentIndex:
                      _selectedCharacter == selected.personagem ? 0 : 1,
                  onTap: _onItemTapped,
                  items: bottomNavItems,
                ),
    );
  }
}
