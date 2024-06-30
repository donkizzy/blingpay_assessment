import 'package:blingpay_assesment/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  final String imageUrl ;
  const PostImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: 600,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(
        value: downloadProgress.progress,
        strokeWidth: 2,
      ),
      errorWidget: (context, url, error) => Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(shape: BoxShape.circle, color: paleBlue.withOpacity(0.3)),
          child: const Icon(Icons.error)),
    );
  }
}
