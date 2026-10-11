import 'package:flutter/material.dart';

enum RevealDirection { fade, slideUp, slideDown, slideLeft, slideRight, scale }

class AnimatedReveal extends StatefulWidget {
  final Widget child;
  final RevealDirection direction;
  final Duration duration;
  final Duration delay;
  final double offset;

  const AnimatedReveal({
    super.key,
    required this.child,
    this.direction = RevealDirection.slideUp,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.offset = 30.0,
  });

  @override
  State<AnimatedReveal> createState() => _AnimatedRevealState();
}

class _AnimatedRevealState extends State<AnimatedReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offsetAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    Offset startOffset = Offset.zero;
    switch (widget.direction) {
      case RevealDirection.slideUp:
        startOffset = Offset(0, widget.offset / 100);
        break;
      case RevealDirection.slideDown:
        startOffset = Offset(0, -widget.offset / 100);
        break;
      case RevealDirection.slideLeft:
        startOffset = Offset(widget.offset / 100, 0);
        break;
      case RevealDirection.slideRight:
        startOffset = Offset(-widget.offset / 100, 0);
        break;
      default:
        startOffset = Offset.zero;
    }

    _offsetAnim = Tween<Offset>(begin: startOffset, end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _scaleAnim = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: widget.direction == RevealDirection.scale
          ? ScaleTransition(scale: _scaleAnim, child: widget.child)
          : SlideTransition(position: _offsetAnim, child: widget.child),
    );
  }
}
