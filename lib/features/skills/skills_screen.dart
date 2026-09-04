import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/widgets/error_retry.dart';
import '../../shared/widgets/shimmer_box.dart';
import 'providers/skills_provider.dart';
import 'widgets/staggered_chip.dart';

class SkillsScreen extends ConsumerWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillsAsync = ref.watch(skillsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Skills')),
      body: skillsAsync.when(
        loading: () => ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: 3,
          itemBuilder: (_, _) => const Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: ShimmerBox(width: double.infinity, height: 70, borderRadius: 12),
          ),
        ),
        error: (err, _) => ErrorRetry(
          message: 'Could not load skills.',
          onRetry: () => ref.invalidate(skillsProvider),
        ),
        data: (categories) {
          var chipIndex = 0;
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category.label, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: category.skills.map((skill) {
                        final delay = Duration(milliseconds: 40 * chipIndex++);
                        return StaggeredChip(label: skill.name, delay: delay);
                      }).toList(),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
