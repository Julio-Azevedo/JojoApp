class Personagem {
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
    const String baseUrl = 'https://jojos-bizarre-api.netlify.app/assets/';
    return Personagem(
      name: json['name'],
      japaneseName: json['japaneseName'],
      image: '$baseUrl${json['image']}',
      chapter: (json['chapter'] as String).split(',').map((e) => e.trim()).toList(),
    );
  }
}