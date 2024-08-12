import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySearchBar extends SearchDelegate<String> {
  MySearchBar({String hintText = ""}) : super(searchFieldLabel: hintText) {
    loadSelectedCategory().then((category) {
      selectedCategory = category ?? "name";
    });
  }

  // Distinção de categorias
  List<String> personagemCategories = [
    "name",
    "nationality",
    "family",
  ];

  List<String> standCategories = [
    "stand",
    "alternateName",
    "abilities",
  ];

  // Nomes para as categorias
  Map<String, String> categoryName = {
    "name": "Name",
    "nationality": "Nationality",
    "family": "Family Member",
    "stand": "Stand",
    "alternateName": "Alt. Stand",
    "abilities": "Ability",
  };

  // Categoria selecionada no início da aplicação
  String selectedCategory = "name";

  // SharedPreferences para salvar a última pesquisa
  Future<void> saveSelectedCategory(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedCategory', category);
  }

  // SharedPreferences para atualizar a última pesquisa
  Future<String?> loadSelectedCategory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('selectedCategory');
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    List<String> categories = [
      ...personagemCategories,
      ...standCategories,
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
                child: Text(categoryName[category]!),
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
    String? type;

    // Verificar se a "query" é de Personagem
    if (personagemCategories.contains(selectedCategory)) {
      type = "personagem";
    }

    // Verificar se a "query" é de Stand
    if (standCategories.contains(selectedCategory)) {
      // em Categorias, "stand" é para ser o nome do Stand.
      if (selectedCategory == "stand") {
        selectedCategory = "name";
      }

      type = "stand";
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, '/searchresult', arguments: {
        'category': selectedCategory,
        'query': query,
        'type': type,
      });
    });

    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
