class Stand {
  final String name;
  final String alternateName;
  final String japaneseName;
  final String image;
  final String battleCry;
  final int standUser;
  final List<String> abilities;
  final List<String> chapter;

  Stand({
    required this.name,
    required this.alternateName,
    required this.japaneseName,
    required this.image,
    required this.battleCry,
    required this.standUser,
    required this.abilities,
    required this.chapter,
  });

  factory Stand.fromJson(Map<String, dynamic> json) {
    return Stand(
      name: json['name'],
      alternateName: json['alternateName'],
      japaneseName: json['japaneseName'],
      image: json['image'],
      battleCry: json['battlecry'],
      standUser: int.parse(json['standUser']),
      abilities: (json['abilities'] as String)
          .split(',')
          .map((ability) => ability.trim())
          .toList(),
      chapter: (json['chapter'] as String)
          .split(',')
          .map((chapter) => chapter.trim())
          .toList(),
    );
  }
}
