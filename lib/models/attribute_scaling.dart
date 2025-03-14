class AttributeScaling {
  String name;
  String value;

  AttributeScaling({
    required this.name,
    required this.value,
  });

  factory AttributeScaling.fromJson(Map<String, dynamic> json) =>
      AttributeScaling(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}
