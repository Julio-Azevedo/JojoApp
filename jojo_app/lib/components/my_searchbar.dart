// widget do search delegate

import 'package:flutter/material.dart';

class MySearchBar extends SearchDelegate<String> {
  final Function changeObjects;

  MySearchBar({String hintText = "", required this.changeObjects})
      : super(searchFieldLabel: hintText);

  String selectedCategory = "name";

  @override
  List<Widget>? buildActions(BuildContext context) {
    List<String> categories = [
      "name",
      "nationality",
      "family",
      "chapter",
    ];

    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            Navigator.of(context).pop();
          } else {
            query = '';
          }
        },
      ),
      DropdownButton<String>(
        value: selectedCategory,
        items: categories
            .map(
              (category) => DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              ),
            )
            .toList(),
        onChanged: (newValue) {
          selectedCategory = newValue!;
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Map<String, dynamic> queryList = {
      selectedCategory: query,
    };

    WidgetsBinding.instance.addPostFrameCallback((_) {
      changeObjects(queryList);
      Navigator.of(context).pop();
    });

    return const CircularProgressIndicator();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
