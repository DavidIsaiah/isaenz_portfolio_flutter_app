import 'package:flutter/material.dart';

class TechChip extends StatelessWidget {
  const TechChip({super.key, required this.label, this.icon});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: icon != null
          ? Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary)
          : null,
      label: Text(label),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
