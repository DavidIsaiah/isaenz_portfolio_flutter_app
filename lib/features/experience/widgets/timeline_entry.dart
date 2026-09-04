import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/experience.dart';

class TimelineEntry extends StatefulWidget {
  const TimelineEntry({super.key, required this.experience, required this.isLast});

  final Experience experience;
  final bool isLast;

  @override
  State<TimelineEntry> createState() => _TimelineEntryState();
}

class _TimelineEntryState extends State<TimelineEntry> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final experience = widget.experience;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                margin: const EdgeInsets.only(top: 4),
                decoration: const BoxDecoration(color: AppColors.gold, shape: BoxShape.circle),
              ),
              if (!widget.isLast)
                Expanded(
                  child: Container(width: 2, color: AppColors.gold.withValues(alpha: 0.25)),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: InkWell(
                onTap: () => setState(() => _expanded = !_expanded),
                borderRadius: BorderRadius.circular(12),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(experience.role, style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 2),
                        Text(
                          experience.company,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 2),
                        Text(experience.dateRange, style: Theme.of(context).textTheme.bodySmall),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          height: _expanded ? null : 0,
                          child: ClipRect(
                            child: Align(
                              alignment: Alignment.topLeft,
                              heightFactor: _expanded ? 1 : 0,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: experience.bullets
                                      .map(
                                        (b) => Padding(
                                          padding: const EdgeInsets.only(bottom: 6),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('•  '),
                                              Expanded(
                                                child: Text(
                                                  b,
                                                  style: Theme.of(context).textTheme.bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            _expanded ? Icons.expand_less : Icons.expand_more,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
