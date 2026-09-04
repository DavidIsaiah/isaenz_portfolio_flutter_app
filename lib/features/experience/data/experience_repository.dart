import 'package:dio/dio.dart';

import '../../../core/api/api_service.dart';
import '../../../core/cache/hive_service.dart';
import '../models/experience.dart';
import 'experience_seed_data.dart';

class ExperienceRepository {
  ExperienceRepository(this._api);

  final ApiService _api;
  static const _cacheKey = 'experience';

  Future<List<Experience>> getExperience() async {
    final box = HiveService.box(HiveService.experienceBox);
    try {
      final json = await _api.getExperience();
      await box.put(_cacheKey, json);
      final items = json
          .map((e) => Experience.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
      items.sort((a, b) => a.displayOrder.compareTo(b.displayOrder));
      return items;
    } on DioException {
      final cached = box.get(_cacheKey) as List?;
      if (cached != null && cached.isNotEmpty) {
        final items = cached
            .map((e) => Experience.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList();
        items.sort((a, b) => a.displayOrder.compareTo(b.displayOrder));
        return items;
      }
      return experienceSeed;
    }
  }
}

final experienceRepository = ExperienceRepository(apiServiceInstance);
