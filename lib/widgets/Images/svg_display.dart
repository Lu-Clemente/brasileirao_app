import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgDisplay extends StatelessWidget {
  final String source;
  final bool isAsset;
  final double width;
  final double height;
  final BoxFit fit;
  final bool showPlaceholder;

  const SvgDisplay({
    super.key,
    required this.source,
    this.isAsset = false,
    this.width = 40.0,
    this.height = 40.0,
    this.fit = BoxFit.contain,
    this.showPlaceholder = true,
  });

  @override
  Widget build(BuildContext context) {
    return isAsset
        ? SvgPicture.asset(
            source,
            width: width,
            height: height,
            fit: fit,
          )
        : SvgPicture.network(
            source,
            width: width,
            height: height,
            fit: fit,
            placeholderBuilder: showPlaceholder
                ? (context) => const CircularProgressIndicator()
                : null,
          );
  }
}
