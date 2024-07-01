import 'package:blingpay_assesment/app_colors.dart';
import 'package:blingpay_assesment/features/post/data/models/post_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotosDetail extends StatelessWidget {
  final PostModel post ;
  const PhotosDetail({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        iconTheme: IconThemeData(
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
        title: Text('Photo',style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color, ),),
        centerTitle: true,
      ),
      body: Hero(
        tag: post.id ?? '6282',
        child: CachedNetworkImage(
          imageUrl: post.link ?? '',
          imageBuilder: (context, imageProvider) => Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
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
        ),
      ),
    ) ;
  }
}
