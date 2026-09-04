import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/skills_repository.dart';
import '../models/skill_category.dart';

final skillsProvider = FutureProvider<List<SkillCategory>>((ref) {
  return skillsRepository.getSkills();
});
