import '../models/skill_category.dart';

/// Local seed mirroring the future GET /api/v1/skills response.
/// Categories match the resume's Technical Skills section exactly.
final List<SkillCategory> skillsSeed = [
  const SkillCategory(
    id: 'languages',
    label: 'Programming Languages',
    skills: [
      Skill(name: 'Dart'),
      Skill(name: 'Java'),
      Skill(name: 'PHP'),
      Skill(name: 'JavaScript'),
      Skill(name: 'SQL'),
    ],
  ),
  const SkillCategory(
    id: 'frameworks',
    label: 'Frameworks & Libraries',
    skills: [
      Skill(name: 'Flutter'),
      Skill(name: 'Riverpod'),
      Skill(name: 'libGDX'),
      Skill(name: 'Spring Boot'),
      Skill(name: 'Yii'),
    ],
  ),
  const SkillCategory(
    id: 'tools',
    label: 'Development Tools',
    skills: [
      Skill(name: 'Docker'),
      Skill(name: 'n8n'),
      Skill(name: 'Git'),
      Skill(name: 'RoboVM / MobiVM'),
      Skill(name: 'Blender'),
    ],
  ),
  const SkillCategory(
    id: 'databases',
    label: 'Databases & Backend',
    skills: [
      Skill(name: 'PostgreSQL'),
      Skill(name: 'MySQL'),
      Skill(name: 'Firebase'),
      Skill(name: 'REST APIs'),
    ],
  ),
  const SkillCategory(
    id: 'web',
    label: 'Web Technologies',
    skills: [
      Skill(name: 'HTML/CSS'),
      Skill(name: 'SendGrid'),
      Skill(name: 'Nutritionix API'),
    ],
  ),
  const SkillCategory(
    id: 'design',
    label: 'Design & Multimedia',
    skills: [
      Skill(name: 'Procreate'),
      Skill(name: 'Canva'),
      Skill(name: 'Adobe Animate'),
      Skill(name: 'Box2D'),
    ],
  ),
  const SkillCategory(
    id: 'methodologies',
    label: 'Methodologies',
    skills: [
      Skill(name: 'Agile'),
      Skill(name: 'Clean Architecture'),
      Skill(name: 'CI/CD'),
    ],
  ),
];
