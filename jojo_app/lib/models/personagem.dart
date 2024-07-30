class Personagem {
  final int id;
  final String name;
  final String japaneseName;
  final String image;
  final String catchPhrase;
  final List<String> family;
  final List<String> chapter;

  Personagem({
    required this.id,
    required this.name,
    required this.japaneseName,
    required this.image,
    required this.catchPhrase,
    required this.family,
    required this.chapter,
  });

  factory Personagem.fromJson(Map<String, dynamic> json) {
    return Personagem(
      id: int.parse(json['id']),
      name: json['name'],
      japaneseName: json['japaneseName'],
      image: json['image'],
      catchPhrase: json['catchphrase'],
      family:
          (json['family'] as String).split(',').map((e) => e.trim()).toList(),
      chapter:
          (json['chapter'] as String).split(',').map((e) => e.trim()).toList(),
    );
  }
}
