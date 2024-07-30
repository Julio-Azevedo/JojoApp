import 'package:flutter/material.dart';

class PoError extends StatelessWidget {
  const PoError({super.key, this.error});
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error ?? 'erro durante a operação'),
      ),
    );
  }
}

