import 'dart:convert';

class Outfit {
  String type;
  String name;
  String description;
  int rarity;
  String image;
  int? price;

  Outfit({
    required this.type,
    required this.name,
    required this.description,
    required this.rarity,
    required this.image,
    this.price,
  });

  factory Outfit.fromRawJson(String str) => Outfit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Outfit.fromJson(Map<String, dynamic> json) => Outfit(
        type: json["type"],
        name: json["name"],
        description: json["description"],
        rarity: json["rarity"],
        image: json["image"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "description": description,
        "rarity": rarity,
        "image": image,
        "price": price,
      };
}
