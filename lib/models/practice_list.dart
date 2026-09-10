/// Eine Übungsliste: eine benannte Sammlung von Vokabeln (per ID).
class PracticeList {
  String id;
  String name;
  List<String> vocabIds;

  PracticeList({
    required this.id,
    required this.name,
    required this.vocabIds,
  });

  factory PracticeList.fromJson(Map<String, dynamic> json) => PracticeList(
        id: json['id'] as String,
        name: json['name'] as String,
        vocabIds: (json['vocabIds'] as List? ?? [])
            .map((e) => e as String)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'vocabIds': vocabIds,
      };
}
