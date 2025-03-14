class Constellation {
  String name;
  String unlock;
  String description;
  int? level;

  Constellation({
    required this.name,
    required this.unlock,
    required this.description,
    this.level,
  });

  factory Constellation.fromJson(Map<String, dynamic> json) => Constellation(
        name: json["name"],
        unlock: json["unlock"],
        description: json["description"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "unlock": unlock,
        "description": description,
        "level": level,
      };
}
