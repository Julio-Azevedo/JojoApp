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
      body: Stack(
        children: [
          // Imagem de fundo
          Positioned.fill(
            child: Image.asset(
              'assets/part7_cover.png', // Substitua pelo caminho da sua imagem
              fit: BoxFit.cover,
            ),
          ),
          // Fundo preto atrás do texto
          Positioned.fill(
            child: Container(
              color: Colors.black
                  .withOpacity(0.8), // Fundo preto com transparência
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "JoJo Wiki",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Este é um projeto feito para a matéria de Programação Orientada a Objetos. A aplicação é voltada a ser uma Wiki de Jojo Bizarre Adventure.",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Explore os personagens e os stands disponíveis!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/personagens');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple, // Cor do botão
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 32,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text("Personagens"),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/stands');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent, // Cor do botão
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 32,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text("Stands"),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}