import 'package:flutter/material.dart';
import 'package:jojo_app/components/my_searchbar.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function? changeObjects;
  const MyAppBar({super.key, this.changeObjects});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("JoJo Wiki"),
      actions: [
        // Search Button
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              await showSearch(
                context: context,
                delegate: MySearchBar(
                  hintText: "Procure por um personagem",
                  changeObjects: changeObjects!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
