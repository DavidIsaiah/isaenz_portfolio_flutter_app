import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/route_paths.dart';
import '../../core/theme/theme_provider.dart';
import '../../shared/widgets/app_network_image.dart';
import '../../shared/widgets/error_retry.dart';
import '../../shared/widgets/shimmer_box.dart';
import '../../shared/widgets/tap_scale.dart';
import 'providers/profile_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        actions: [
          IconButton(
            tooltip: 'Toggle theme',
            icon: Icon(themeMode == ThemeMode.dark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            onPressed: () => ref.read(themeModeProvider.notifier).toggle(),
          ),
        ],
      ),
      body: profileAsync.when(
        loading: () => const _HomeShimmer(),
        error: (err, _) => ErrorRetry(
          message: 'Could not load profile.',
          onRetry: () => ref.invalidate(profileProvider),
        ),
        data: (profile) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(profileProvider),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(
                children: [
                  ClipOval(
                    child: SizedBox(
                      width: 72,
                      height: 72,
                      child: AppNetworkImage(url: profile.photoUrl),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(profile.name, style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 4),
                        Text(
                          profile.tagline,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(profile.bio, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 24),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: profile.skillChips.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, index) => Chip(label: Text(profile.skillChips[index])),
                ),
              ),
              const SizedBox(height: 28),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: [
                  _NavCard(
                    icon: Icons.grid_view_outlined,
                    label: 'View Projects',
                    onTap: () => context.go(RoutePaths.projects),
                  ),
                  _NavCard(
                    icon: Icons.timeline_outlined,
                    label: 'My Experience',
                    onTap: () => context.go(RoutePaths.experience),
                  ),
                  _NavCard(
                    icon: Icons.star_outline,
                    label: 'Skills',
                    onTap: () => context.go(RoutePaths.skills),
                  ),
                  _NavCard(
                    icon: Icons.mail_outline,
                    label: 'Contact',
                    onTap: () => context.go(RoutePaths.contact),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  const _NavCard({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TapScale(
      onTap: onTap,
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary, size: 28),
              const SizedBox(height: 8),
              Text(label, style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeShimmer extends StatelessWidget {
  const _HomeShimmer();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          children: [
            const ShimmerBox(width: 72, height: 72, borderRadius: 36),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ShimmerBox(width: 160, height: 18),
                  SizedBox(height: 8),
                  ShimmerBox(width: 200, height: 14),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const ShimmerBox(width: double.infinity, height: 60),
        const SizedBox(height: 24),
        const ShimmerBox(width: double.infinity, height: 40),
      ],
    );
  }
}
