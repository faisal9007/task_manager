import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../utils/assets_path.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AssetsPath.backgraoundSVG,

          // Make sure the name is correct
          fit: BoxFit.cover,

          width: double.infinity,
          height: double.infinity,
        ),
        SafeArea(child: child)
      ],
    );
  }
}
