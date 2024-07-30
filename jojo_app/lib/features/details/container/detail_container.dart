import 'package:flutter/material.dart';
import 'package:jojo_app/common/error/failure.dart';
import 'package:jojo_app/common/models/personagem.dart';
import 'package:jojo_app/common/repository/jojo_repository.dart';
import 'package:jojo_app/common/widgets/po_error.dart';
import 'package:jojo_app/common/widgets/po_loading.dart';
import 'package:jojo_app/features/details/pages/detail_page.dart';

class DetailArguments {
  DetailArguments({required this.personagem});
  final Personagem personagem;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {super.key, required this.repository, required this.arguments});
  final IJojoRepository repository;
  final DetailArguments arguments;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Personagem>>(
        future: repository.getAllPersonagens(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const PoLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return DetailPage(
                personagem: arguments.personagem, list: snapshot.data!);
          }

          if (snapshot.hasError) {
            return PoError(error: (snapshot.error as Failure).message!);
          }

          return Container();
        });
  }
}
