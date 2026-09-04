import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/route_paths.dart';
import '../../shared/widgets/error_retry.dart';
import '../../shared/widgets/shimmer_box.dart';
import 'models/project.dart';
import 'providers/projects_provider.dart';
import 'widgets/project_card.dart';

const _categoryTabs = <ProjectCategory?>[
  null,
  ProjectCategory.mobileApps,
  ProjectCategory.games,
  ProjectCategory.artAndComics,
  ProjectCategory.web,
];

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtered = ref.watch(filteredProjectsProvider);
    final selected = ref.watch(projectCategoryFilterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      body: Column(
        children: [
          SizedBox(
            height: 48,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              scrollDirection: Axis.horizontal,
              itemCount: _categoryTabs.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final category = _categoryTabs[index];
                final isSelected = category == selected;
                return ChoiceChip(
                  label: Text(category?.label ?? 'All'),
                  selected: isSelected,
                  onSelected: (_) =>
                      ref.read(projectCategoryFilterProvider.notifier).select(category),
                );
              },
            ),
          ),
          Expanded(
            child: filtered.when(
              loading: () => GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: 4,
                itemBuilder: (_, _) => const ShimmerCard(),
              ),
              error: (err, _) => ErrorRetry(
                message: 'Could not load projects.',
                onRetry: () => ref.invalidate(projectsProvider),
              ),
              data: (projects) {
                if (projects.isEmpty) {
                  return const Center(child: Text('No projects in this category yet.'));
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    return ProjectCard(
                      project: project,
                      heroTag: 'project-cover-${project.id}',
                      onTap: () => context.push(RoutePaths.projectDetailPath(project.id)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
