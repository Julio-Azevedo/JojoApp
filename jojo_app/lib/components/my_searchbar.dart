import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySearchBar extends SearchDelegate<String> {
  final Function? changeObjects;

  MySearchBar({String hintText = "", this.changeObjects})
      : super(searchFieldLabel: hintText) {
    loadSelectedCategory().then((category) {
      selectedCategory = category ?? "name";
    });
  }

  String selectedCategory = "name";

  Future<void> saveSelectedCategory(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedCategory', category);
  }

  Future<String?> loadSelectedCategory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('selectedCategory');
  }

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
          saveSelectedCategory(newValue);
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, '/searchresult',
          arguments: {'category': selectedCategory, 'query': query});
    });

    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
