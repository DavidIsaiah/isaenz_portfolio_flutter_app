import 'package:dio/dio.dart';

import '../../../core/api/api_service.dart';
import '../../../core/cache/hive_service.dart';
import '../models/project.dart';
import 'projects_seed_data.dart';

class ProjectsRepository {
  ProjectsRepository(this._api);

  final ApiService _api;
  static const _cacheKey = 'projects';

  Future<List<Project>> getProjects() async {
    final box = HiveService.box(HiveService.projectsBox);
    try {
      final json = await _api.getProjects();
      await box.put(_cacheKey, json);
      return json
          .map((e) => Project.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
    } on DioException {
      final cached = box.get(_cacheKey) as List?;
      if (cached != null && cached.isNotEmpty) {
        return cached
            .map((e) => Project.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList();
      }
      return projectsSeed;
    }
  }

  Future<Project?> getProjectById(String id) async {
    try {
      final json = await _api.getProjectById(id);
      return Project.fromJson(json);
    } on DioException {
      final all = await getProjects();
      try {
        return all.firstWhere((p) => p.id == id);
      } catch (_) {
        return null;
      }
    }
  }
}

final projectsRepository = ProjectsRepository(apiServiceInstance);
