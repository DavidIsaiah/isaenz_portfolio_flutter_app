import 'package:dio/dio.dart';

import '../../../core/api/api_service.dart';
import '../../../core/cache/hive_service.dart';
import '../models/skill_category.dart';
import 'skills_seed_data.dart';

class SkillsRepository {
  SkillsRepository(this._api);

  final ApiService _api;
  static const _cacheKey = 'skills';

  Future<List<SkillCategory>> getSkills() async {
    final box = HiveService.box(HiveService.skillsBox);
    try {
      final json = await _api.getSkills();
      await box.put(_cacheKey, json);
      return json
          .map((e) => SkillCategory.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
    } on DioException {
      final cached = box.get(_cacheKey) as List?;
      if (cached != null && cached.isNotEmpty) {
        return cached
            .map((e) => SkillCategory.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList();
      }
      return skillsSeed;
    }
  }
}

final skillsRepository = SkillsRepository(apiServiceInstance);
