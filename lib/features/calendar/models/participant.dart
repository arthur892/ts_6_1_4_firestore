class Participant {
  String name;
  String age;

  Participant({required this.name, required this.age});

  factory Participant.fromMap(Map<String, dynamic> data) {
    return Participant(name: data['name'] ?? "", age: data['age'] ?? "");
  }
  @override
  String toString() {
    // TODO: implement toString
    return "Teilnehmer: $name, $age";
  }
}
