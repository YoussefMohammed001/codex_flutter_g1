import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  const AppSvg({super.key, required this.image, this.color, this.width, this.height});
final String image;
final Color? color;
final double? width;
final double? height;

  @override
  Widget build(BuildContext context) {
    return  SvgPicture.asset(
      "assets/images/svgs/$image.svg",
      color: color,
      height: height,
      width: width,
    );
  }
}
