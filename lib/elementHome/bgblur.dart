import 'dart:ui';

import 'package:flutter/cupertino.dart';

class BgBlur extends StatelessWidget {
  final double blur, opacity;
  final Widget child;
  const BgBlur({
    super.key,
    required this.blur,
    required this.opacity,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),),
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),),
                
            child: child),
      ),
    );
  }
}
