import 'package:flutter/material.dart';

class HoverScale extends StatefulWidget {
  final Widget child;
  final double scale;
  final Duration duration;
  final VoidCallback? onTap;

  const HoverScale({
    super.key,
    required this.child,
    this.scale = 1.03,
    this.duration = const Duration(milliseconds: 250),
    this.onTap,
  });

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: widget.duration,
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()..scale(_isHovered ? widget.scale : 1.0),
          transformAlignment: Alignment.center,
          child: widget.child,
        ),
      ),
    );
  }
}
