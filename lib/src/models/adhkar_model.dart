class AdhkarModel {
  final String id, category, count, description, reference, dhikr;
int remainingCount;
  AdhkarModel({
    required this.id,
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.dhikr,
  }) : remainingCount = int.tryParse(count) ?? 1;

  factory AdhkarModel.fromJson(Map<String, dynamic> json) {
    return AdhkarModel(
        id: json['id'],
        category: json['category'],
        count: json['count'],
        description: json['description'],
        reference: json['reference'],
        dhikr: json['dhikr']);
  }


}
