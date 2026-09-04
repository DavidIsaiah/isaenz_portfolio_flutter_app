import 'package:flutter/material.dart';

class StaggeredChip extends StatefulWidget {
  const StaggeredChip({super.key, required this.label, required this.delay});

  final String label;
  final Duration delay;

  @override
  State<StaggeredChip> createState() => _StaggeredChipState();
}

class _StaggeredChipState extends State<StaggeredChip> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Chip(label: Text(widget.label)),
      ),
    );
  }
}
