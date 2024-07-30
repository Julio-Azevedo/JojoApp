class Personagem {
  static const String BASE_URL =
      'https://jojos-bizarre-api.netlify.app/assets/';
  final String name;
  final String japaneseName;
  final String image;
  final List<String> chapter;

  Personagem({
    required this.name,
    required this.japaneseName,
    required this.image,
    required this.chapter,
  });

  factory Personagem.fromMap(Map<String, dynamic> json) {
    return Personagem(
      name: json['name'],
      japaneseName: json['japaneseName'],
      image: '$BASE_URL${json['image']}',
      chapter:
          (json['chapter'] as String).split(',').map((e) => e.trim()).toList(),
    );
  }
}
