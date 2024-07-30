import 'package:flutter/material.dart';
import 'package:jojo_app/common/models/personagem.dart';
import 'package:jojo_app/features/details/container/detail_container.dart';
import 'package:jojo_app/features/home/pages/widgets/personagem_icon_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.list, required this.onItemTap});
  final List<Personagem> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        /*
          title: const Padding(
            padding: EdgeInsets.only(left: 4),
            child:
                Text('JojoWiki', style: TextStyle(fontWeight: FontWeight.bold)),
          )*/
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        centerTitle: true,
        title:
            Text('BizarreWiki', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 8),
          children: list
              .map((e) => PersonagemIconWidget(personagem: e, onTap: onItemTap))
              .toList()),
    );
  }
}
