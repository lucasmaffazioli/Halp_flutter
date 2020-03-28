import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageFormatter extends StatelessWidget {
  final Widget child;
  final double height;
  final String image;

  ImageFormatter({this.child, this.height, this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: IntrinsicHeight(
          child: CachedNetworkImage(
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageUrl: image,
            fit: BoxFit.cover,
            // placeholder: (context, url) => new CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
