import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

class AutoplayBackgroundVideo extends StatefulWidget {
  final String videoUrl;
  final String fallbackImageUrl;
  final Widget child;

  const AutoplayBackgroundVideo({
    super.key,
    required this.videoUrl,
    required this.fallbackImageUrl,
    required this.child,
  });

  @override
  State<AutoplayBackgroundVideo> createState() => _AutoplayBackgroundVideoState();
}

class _AutoplayBackgroundVideoState extends State<AutoplayBackgroundVideo> {
  late String _viewId;

  @override
  void initState() {
    super.initState();
    _viewId = 'hero-bg-video-${DateTime.now().microsecondsSinceEpoch}';

    if (kIsWeb) {
      ui_web.platformViewRegistry.registerViewFactory(_viewId, (int viewId) {
        final videoElement = html.VideoElement()
          ..src = widget.videoUrl
          ..autoplay = true
          ..loop = true
          ..muted = true
          ..controls = false
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.objectFit = 'cover'
          ..style.border = 'none'
          ..style.pointerEvents = 'none'
          ..setAttribute('playsinline', 'true')
          ..setAttribute('muted', 'true')
          ..setAttribute('autoplay', 'true')
          ..setAttribute('loop', 'true');

        // Trigger explicit play for web autoplay policies
        videoElement.play().catchError((_) {});

        return videoElement;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Fallback image background while video loads
        Image.network(
          widget.fallbackImageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(color: Colors.black),
        ),

        // Autoplay Web Video Layer
        if (kIsWeb)
          IgnorePointer(
            child: HtmlElementView(viewType: _viewId),
          ),

        // Content & Dark Luxury Overlay Layer
        widget.child,
      ],
    );
  }
}
