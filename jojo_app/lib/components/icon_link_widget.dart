import 'package:flutter/material.dart';
import 'package:jojo_app/models/personagem.dart';
import 'package:jojo_app/pages/details_page.dart';
import 'package:jojo_app/services/jojo_service.dart';

class IconLink extends StatefulWidget {
  final JoJoService jojoService;
  final String familyMember;

  const IconLink(this.familyMember, {super.key, required this.jojoService});

  @override
  State<IconLink> createState() => _IconLinkState();
}

class _IconLinkState extends State<IconLink> {
  Personagem? _personagem;
  ImageProvider _imgIcon = const AssetImage('assets/dummy.png');

  @override
  initState() {
    super.initState();
    _getFamilyImage();
  }

  _getFamilyImage() async {
    var query = {'name': widget.familyMember};

    List<Personagem> personagem =
        await widget.jojoService.getPersonagemByQuery(query);

    if (personagem.isNotEmpty) {
      setState(() {
        _imgIcon = NetworkImage(
            'https://jojos-bizarre-api.netlify.app/assets/${personagem[0].image}');
        _personagem = personagem[0];
      });
    }
  }

  _goToFamilyMember() {
    if (_personagem != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailsPage(
            character: _personagem,
            jojoService: widget.jojoService,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: _goToFamilyMember,
          icon: _personagem != null
              ? ImageIcon(_imgIcon)
              : const Icon(Icons.no_accounts),
          iconSize: 60,
        ),
        Text(
          widget.familyMember,
          textAlign: TextAlign.center,
          softWrap: true,
          overflow: TextOverflow.visible,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            fontFamily: 'Verdana',
          ),
        ),
      ],
    );
  }
}
