import 'package:blingpay_assesment/app_colors.dart';
import 'package:blingpay_assesment/features/post/data/models/post_model.dart';
import 'package:blingpay_assesment/features/post/presentation/pages/photos_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  final PostModel post;

  const PostImage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PhotosDetail(post: post,)));
      },
      child: Hero(
        tag: post.id ?? '6282',
        child: CachedNetworkImage(
          imageUrl: post.link ?? '',
          imageBuilder: (context, imageProvider) => Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
              strokeWidth: 2,
            ),
          ),
          errorWidget: (context, url, error) => Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(shape: BoxShape.circle, color: paleBlue.withOpacity(0.3)),
              child: const Icon(Icons.error)),
        ),
      ),
    );
  }
}
