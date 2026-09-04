import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/widgets/error_retry.dart';
import '../../shared/widgets/shimmer_box.dart';
import 'providers/experience_provider.dart';
import 'widgets/timeline_entry.dart';

class ExperienceScreen extends ConsumerWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experienceAsync = ref.watch(experienceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Experience')),
      body: experienceAsync.when(
        loading: () => ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: 4,
          itemBuilder: (_, _) => const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ShimmerBox(width: double.infinity, height: 90, borderRadius: 16),
          ),
        ),
        error: (err, _) => ErrorRetry(
          message: 'Could not load experience.',
          onRetry: () => ref.invalidate(experienceProvider),
        ),
        data: (entries) => ListView.builder(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
          itemCount: entries.length,
          itemBuilder: (context, index) => TimelineEntry(
            experience: entries[index],
            isLast: index == entries.length - 1,
          ),
        ),
      ),
    );
  }
}
