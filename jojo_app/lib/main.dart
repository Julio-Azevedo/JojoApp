// packages
import 'package:flutter/material.dart';
// pages
import 'package:jojo_app/pages/home_page.dart';
import 'package:jojo_app/pages/list_page.dart';
import 'package:jojo_app/pages/details_page.dart';
// services
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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/personagens': (context) => ListPage(jojoService: service),
        '/stands': (context) => ListPage(jojoService: service),
        '/searchresult': (context) => ListPage(jojoService: service),
        '/details': (context) => DetailsPage(jojoService: service),
      },
    );
  }
}
