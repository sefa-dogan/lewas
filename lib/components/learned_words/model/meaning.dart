
import 'package:learn_english/components/home/model/definition.dart';

class Meaning {
  Meaning({required this.partOfSpeech, required this.definitions, z});

  final String partOfSpeech;
  final List<Definition> definitions;

  factory Meaning.fromMap(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"],
        definitions: List<Definition>.from(
            json["definitions"].map((x) => Definition.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "partOfSpeech": partOfSpeech,
        "definitions": List<dynamic>.from(definitions.map((x) => x.toMap())),
      };
}