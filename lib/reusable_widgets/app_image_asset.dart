import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  const ImageAsset({super.key, required this.image, this.width, this.height, this.fit});
final String image;
final double? width;
final double? height;
final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/pngs/$image.png",
      width: width,
      height: height,
      fit: fit,
    );
  }
}
