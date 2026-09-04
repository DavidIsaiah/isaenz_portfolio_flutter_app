import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/projects_repository.dart';
import '../models/project.dart';

final projectsProvider = FutureProvider<List<Project>>((ref) {
  return projectsRepository.getProjects();
});

class ProjectCategoryFilterNotifier extends Notifier<ProjectCategory?> {
  @override
  ProjectCategory? build() => null;

  void select(ProjectCategory? category) => state = category;
}

final projectCategoryFilterProvider =
    NotifierProvider<ProjectCategoryFilterNotifier, ProjectCategory?>(
  ProjectCategoryFilterNotifier.new,
);

final filteredProjectsProvider = Provider<AsyncValue<List<Project>>>((ref) {
  final projectsAsync = ref.watch(projectsProvider);
  final category = ref.watch(projectCategoryFilterProvider);
  return projectsAsync.whenData((projects) {
    if (category == null) return projects;
    return projects.where((p) => p.category == category).toList();
  });
});

final projectByIdProvider = FutureProvider.family<Project?, String>((ref, id) async {
  final projects = await ref.watch(projectsProvider.future);
  try {
    return projects.firstWhere((p) => p.id == id);
  } catch (_) {
    return null;
  }
});
