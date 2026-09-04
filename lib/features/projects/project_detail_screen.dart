import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/widgets/app_network_image.dart';
import '../../shared/widgets/error_retry.dart';
import '../../shared/widgets/tech_chip.dart';
import 'providers/projects_provider.dart';

class ProjectDetailScreen extends ConsumerWidget {
  const ProjectDetailScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectAsync = ref.watch(projectByIdProvider(projectId));

    return Scaffold(
      body: projectAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => ErrorRetry(
          message: 'Could not load project.',
          onRetry: () => ref.invalidate(projectByIdProvider(projectId)),
        ),
        data: (project) {
          if (project == null) {
            return const Center(child: Text('Project not found.'));
          }
          final groupedTech = <String, List<String>>{};
          for (final item in project.techStack) {
            groupedTech.putIfAbsent(item.group, () => []).add(item.label);
          }

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 260,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: 'project-cover-${project.id}',
                    child: AppNetworkImage(url: project.coverImageUrl),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(project.title, style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 4),
                      Text(
                        '${project.platform} · ${project.dateRange}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(project.description, style: Theme.of(context).textTheme.bodyLarge),
                      if (project.galleryImages.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Text('Gallery', style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 160,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: project.galleryImages.length,
                            separatorBuilder: (_, _) => const SizedBox(width: 10),
                            itemBuilder: (context, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                width: 220,
                                child: AppNetworkImage(url: project.galleryImages[index]),
                              ),
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 24),
                      Text('Tech Stack', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 12),
                      ...groupedTech.entries.map(
                        (entry) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                entry.key,
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                              const SizedBox(height: 6),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children:
                                    entry.value.map((label) => TechChip(label: label)).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (project.externalLinks.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: project.externalLinks
                              .map(
                                (link) => ElevatedButton.icon(
                                  onPressed: () => launchUrl(
                                    Uri.parse(link.url),
                                    mode: LaunchMode.externalApplication,
                                  ),
                                  icon: const Icon(Icons.open_in_new, size: 18),
                                  label: Text(link.label),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
