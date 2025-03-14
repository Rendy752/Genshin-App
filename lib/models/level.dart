class Level {
  String name;
  int value;

  Level({
    required this.name,
    required this.value,
  });

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}
