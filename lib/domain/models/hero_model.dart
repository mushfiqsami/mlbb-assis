class HeroModel {
  final String name;
  final String lane;
  final String image;

  final List<String> strongAgainst;
  final List<String> weakAgainst;
  final List<String> synergy;

  HeroModel({
    required this.name,
    required this.lane,
    required this.image,
    required this.strongAgainst,
    required this.weakAgainst,
    required this.synergy,
  });

  // Factory from JSON entry
  factory HeroModel.fromJson(String name, Map<String, dynamic> data) {
    return HeroModel(
      name: name,
      lane: data["lane"] ?? "",
      image: "assets/images/heroes/${name.toLowerCase()}.png",
      strongAgainst: List<String>.from(data["strong"] ?? []),
      weakAgainst: List<String>.from(data["weak"] ?? []),
      synergy: List<String>.from(data["synergy"] ?? []),
    );
  }
}
