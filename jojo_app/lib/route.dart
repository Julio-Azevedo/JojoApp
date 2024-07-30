import 'package:flutter/material.dart';
import 'package:jojo_app/common/repository/jojo_repository.dart';
import 'package:jojo_app/features/details/container/detail_container.dart';
import 'package:jojo_app/features/home/container/home_container.dart';

class JojoRoute extends StatelessWidget {
  const JojoRoute({super.key, required this.repository});
  final JojoRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) {
            return HomeContainer(
              repository: repository,
              onItemTap: (route, arguments) {
                Navigator.of(context).pushNamed(route, arguments: arguments);
              },
            );
          });
        }
        if (settings.name == '/details') {
          return MaterialPageRoute(builder: (context) {
            return DetailContainer(
                repository: repository,
                arguments: (settings.arguments as DetailArguments));
          });
        }
        return null;
      },
    );
  }
}
