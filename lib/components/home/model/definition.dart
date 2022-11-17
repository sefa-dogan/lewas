class Definition {
  Definition({
    required this.definition,
  });

  final String definition;

  factory Definition.fromMap(Map<String, dynamic> json) => Definition(
        definition: json["definition"],
      );

  Map<String, dynamic> toMap() => {
        "definition": definition,
      };
}
