import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageHolder extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  const ImageHolder(
      {Key? key,
      required this.imageUrl,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ??
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3MBeYPMCdwACmvN3ELRgqE1jR-WZU3sMtEX04whWS1ie3Y5AGQ4abjjed6--5EvBcjDg&usqp=CAU',
      height: height,
      width: width,
      fit: BoxFit.contain,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white60,
        period: const Duration(milliseconds: 500),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        'assets/images/no_image.jpeg',
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
