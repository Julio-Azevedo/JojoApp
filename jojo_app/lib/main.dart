// packages
import 'package:flutter/material.dart';
// models
import 'package:jojo_app/pages/list_page.dart';
// pages
import 'package:jojo_app/services/jojo_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final service = JoJoService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BizarreApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPage(jojoService: service),
      //JojoRoute(repository: JojoRepository(dio: Dio())),
      /*HomeContainer(
        repository: JojoRepository(dio: Dio()),
        ),*/
    );
  }
}
