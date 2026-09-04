class Skill {
  final String name;
  final String? iconUrl;

  const Skill({required this.name, this.iconUrl});

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        name: json['name'] as String,
        iconUrl: json['iconUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {'name': name, 'iconUrl': iconUrl};
}

class SkillCategory {
  final String id;
  final String label;
  final List<Skill> skills;

  const SkillCategory({required this.id, required this.label, required this.skills});

  factory SkillCategory.fromJson(Map<String, dynamic> json) => SkillCategory(
        id: json['id'] as String,
        label: json['label'] as String,
        skills: (json['skills'] as List)
            .map((e) => Skill.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'skills': skills.map((e) => e.toJson()).toList(),
      };
}
