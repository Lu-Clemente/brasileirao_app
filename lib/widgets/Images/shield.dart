import 'package:brasileirao_app/widgets/Images/svg_display.dart';
import 'package:flutter/material.dart';

class Shield extends StatelessWidget {
  final String imageSrc;
  final double size;
  final bool isAsset;
  final BoxFit fit;

  const Shield({
    super.key,
    required this.imageSrc,
    this.size = 40,
    this.isAsset = false,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Hero(
        tag: imageSrc,
        child: SvgDisplay(
          source: imageSrc,
          width: size,
          height: size,
          isAsset: isAsset,
          fit: fit,
        ),
      ),
    );
  }
}
