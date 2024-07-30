import 'package:flutter/material.dart';
import 'package:jojo_app/common/error/failure.dart';
import 'package:jojo_app/common/models/personagem.dart';
import 'package:jojo_app/common/repository/jojo_repository.dart';
import 'package:jojo_app/common/widgets/po_error.dart';
import 'package:jojo_app/common/widgets/po_loading.dart';
import 'package:jojo_app/features/details/container/detail_container.dart';
import 'package:jojo_app/features/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {super.key, required this.repository, required this.onItemTap});
  final IJojoRepository repository;
  final Function(String, DetailArguments) onItemTap;

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
            return HomePage(
              list: snapshot.data!,
              onItemTap: onItemTap,
            );
          }

          if (snapshot.hasError) {
            return PoError(error: (snapshot.error as Failure).message!);
          }

          return Container();
        });
  }
}
