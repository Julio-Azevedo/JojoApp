import 'package:flutter/material.dart';

class PoLoading extends StatelessWidget {
  const PoLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}