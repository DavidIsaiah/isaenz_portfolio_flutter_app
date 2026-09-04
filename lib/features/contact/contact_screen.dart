import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/widgets/error_retry.dart';
import '../../shared/widgets/tap_scale.dart';
import '../home/models/profile.dart';
import '../home/providers/profile_provider.dart';

IconData _iconForType(String type) {
  switch (type) {
    case 'email':
      return Icons.email_outlined;
    case 'linkedin':
      return Icons.business_center_outlined;
    case 'website':
      return Icons.language_outlined;
    case 'tapas':
      return Icons.menu_book_outlined;
    default:
      return Icons.link;
  }
}

class ContactScreen extends ConsumerWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => ErrorRetry(
          message: 'Could not load contact info.',
          onRetry: () => ref.invalidate(profileProvider),
        ),
        data: (profile) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            for (final link in profile.contactLinks) ...[
              _ContactButton(link: link),
              const SizedBox(height: 12),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.location_on_outlined),
                const SizedBox(width: 8),
                Expanded(
                  child: Text('${profile.location} — Open to on-site opportunities'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (profile.usCitizen)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.verified_outlined, size: 18, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 8),
                    const Text('US Citizen'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  const _ContactButton({required this.link});

  final ContactLink link;

  @override
  Widget build(BuildContext context) {
    return TapScale(
      onTap: () => launchUrl(Uri.parse(link.url), mode: LaunchMode.externalApplication),
      child: Card(
        child: ListTile(
          leading: Icon(_iconForType(link.type), color: Theme.of(context).colorScheme.primary),
          title: Text(link.label),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
        ),
      ),
    );
  }
}
