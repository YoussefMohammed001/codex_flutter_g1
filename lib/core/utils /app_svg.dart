import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  const AppSvg({super.key, required this.asset, this.colorFilter});
final String asset;
final ColorFilter? colorFilter;
  @override
  Widget build(BuildContext context) {
    return   SvgPicture.asset(
      "assets/svgs/$asset.svg",
      colorFilter:  colorFilter
    );
  }
}
