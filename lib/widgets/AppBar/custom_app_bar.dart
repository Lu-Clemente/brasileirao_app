import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  final Size preferredSize;
  final String backgroundImage;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.backgroundImage = 'assets/images/banner-1.png',
    this.preferredSize = const Size.fromHeight(340.0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(backgroundImage, fit: BoxFit.cover),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leading ?? const SizedBox(),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                Row(children: actions ?? []),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
