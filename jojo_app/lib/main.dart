// packages
//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// models
import 'package:jojo_app/common/models/personagem.dart';
// pages
//import 'package:jojo_app/common/repository/jojo_repository.dart';
//import 'package:jojo_app/features/route.dart';
import 'package:jojo_app/services/jojo_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    JoJoService jojoService = JoJoService();

    jojoService.getAllStands().then((stands) {
      stands.forEach((stand) {
        print(stand.name);
      });
    });

    return MaterialApp(
      title: 'BizarreApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Column(
          children: [
            Text('Hello, world!'),
          ],
        ),
      ),
      //JojoRoute(repository: JojoRepository(dio: Dio()))

      /*HomeContainer(
        repository: JojoRepository(dio: Dio()),
        ),*/
    );
  }
}
