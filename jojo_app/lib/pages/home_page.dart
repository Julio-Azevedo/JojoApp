// Página Inicial para entrada no App

import 'package:flutter/material.dart';
import 'package:jojo_app/components/my_appbar.dart';
import 'package:jojo_app/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: const MyAppBar(),
      drawer: const MyDrawer(),
      body: const Center(child: Text("Home Page")),
    );
  }
}
