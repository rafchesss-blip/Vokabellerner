/// Eine Übungsliste: eine benannte Sammlung von Vokabeln (per ID).
class PracticeList {
  String id;
  String name;
  List<String> vocabIds;

  /// Zieldatum, bis zu dem die Vokabeln gewusst werden sollen (optional).
  DateTime? dueDate;

  /// Ob die Liste Lern-Erinnerungen auslöst (Android-App).
  bool notify;

  PracticeList({
    required this.id,
    required this.name,
    required this.vocabIds,
    this.dueDate,
    this.notify = true,
  });

  factory PracticeList.fromJson(Map<String, dynamic> json) => PracticeList(
        id: json['id'] as String,
        name: json['name'] as String,
        vocabIds: (json['vocabIds'] as List? ?? [])
            .map((e) => e as String)
            .toList(),
        dueDate: json['dueDate'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['dueDate'] as int),
        notify: json['notify'] as bool? ?? true,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'vocabIds': vocabIds,
        'dueDate': dueDate?.millisecondsSinceEpoch,
        'notify': notify,
      };
}
