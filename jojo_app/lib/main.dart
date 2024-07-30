import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jojo_app/common/repository/jojo_repository.dart';
import 'package:jojo_app/features/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BizarreApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: JojoRoute(repository: JojoRepository(dio: Dio()))

        /*HomeContainer(
        repository: JojoRepository(dio: Dio()),
        ),*/
        );
  }
}
