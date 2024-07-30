import 'package:flutter/material.dart';

class ChapterWidget extends StatelessWidget {
  const ChapterWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
    );
  }
}

