import 'dart:convert';

class Upgrade {
  String name;
  String value;

  Upgrade({
    required this.name,
    required this.value,
  });

  factory Upgrade.fromRawJson(String str) => Upgrade.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Upgrade.fromJson(Map<String, dynamic> json) => Upgrade(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}
