// Página Inicial para entrada no App

import 'package:flutter/material.dart';
import 'package:jojo_app/components/my_appbar.dart';
import 'package:jojo_app/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: Center(child: Text("Home Page")),
    );
  }
}
