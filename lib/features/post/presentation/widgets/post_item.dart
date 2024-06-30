import 'package:blingpay_assesment/app_colors.dart';
import 'package:blingpay_assesment/features/post/data/models/post_model.dart';
import 'package:blingpay_assesment/features/post/data/models/video_list_data.dart';
import 'package:blingpay_assesment/features/post/presentation/widgets/post_image.dart';
import 'package:blingpay_assesment/features/post/presentation/widgets/reuseable_video_controller.dart';
import 'package:blingpay_assesment/features/post/presentation/widgets/reuseable_video_list_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostItem extends StatefulWidget {
  final PostModel postModel;
  final ReusableVideoListController? videoListController;
  final Function? canBuildVideo;

  const PostItem({super.key, required this.postModel, this.videoListController, this.canBuildVideo});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: widget.postModel.thumbnail ?? '',
          imageBuilder: (context, imageProvider) => Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
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
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.postModel.username ?? 'N/A',style: const TextStyle(fontSize: 16),),
            const SizedBox(height: 10,),
            post(widget.postModel)
          ],
        ))
      ],
    );
  }

  PostType getPostType(PostModel post) {
    if (post.noMedia == false) {
      if (post.video == true) {
        return PostType.video;
      } else {
        return PostType.image;
      }
    } else {
      return PostType.text;
    }
  }

  Widget post(PostModel post) {
    switch (getPostType(post)) {
      case PostType.video:
        return ReusableVideoListWidget(
         canBuildVideo: widget.canBuildVideo,
         videoListController: widget.videoListController,
         videoListData: VideoListData(widget.postModel.link ?? ''),
        );
      case PostType.image:
        return PostImage(imageUrl: post.link ?? '',);
      default:
        return Text(post.description ?? '');
    }
  }


}

enum PostType { video, image, text }
