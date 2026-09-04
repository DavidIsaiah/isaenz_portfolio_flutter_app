class Experience {
  final String id;
  final String role;
  final String company;
  final String? companyUrl;
  final String startDate;
  final String endDate;
  final List<String> bullets;
  final int displayOrder;

  const Experience({
    required this.id,
    required this.role,
    required this.company,
    this.companyUrl,
    required this.startDate,
    required this.endDate,
    required this.bullets,
    required this.displayOrder,
  });

  String get dateRange => '$startDate – $endDate';

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json['id'] as String,
        role: json['role'] as String,
        company: json['company'] as String,
        companyUrl: json['companyUrl'] as String?,
        startDate: json['startDate'] as String,
        endDate: json['endDate'] as String,
        bullets: (json['bullets'] as List).cast<String>(),
        displayOrder: json['displayOrder'] as int,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'role': role,
        'company': company,
        'companyUrl': companyUrl,
        'startDate': startDate,
        'endDate': endDate,
        'bullets': bullets,
        'displayOrder': displayOrder,
      };
}
