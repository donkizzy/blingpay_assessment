import 'package:blingpay_assesment/app_colors.dart';
import 'package:blingpay_assesment/features/post/data/models/post_model.dart';
import 'package:blingpay_assesment/features/post/data/models/video_list_data.dart';
import 'package:blingpay_assesment/features/post/presentation/widgets/post_image.dart';
import 'package:blingpay_assesment/features/post/presentation/widgets/reuseable_video_controller.dart';
import 'package:blingpay_assesment/features/post/presentation/widgets/post_video.dart';
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
  late String postDate ;
  @override
  void initState() {
    postDate = DateTime.fromMillisecondsSinceEpoch(widget.postModel.timestamp ?? -1).toString().substring(0,10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Divider(color: paleBlue.withOpacity(0.6),height: 0.5,),
        const SizedBox(height: 10,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.postModel.thumbnail ?? '',
              imageBuilder: (context, imageProvider) => Container(
                height: 35,
                width: 35,
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
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.postModel.username ?? 'N/A',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 10,),
                    Text(postDate,
                      style:  TextStyle(fontSize: 10, fontWeight: FontWeight.w700,color: Colors.grey.withOpacity(0.6)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.postModel.description ?? '',
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(
                  height: 10,
                ),
                post(widget.postModel)
              ],
            ))
          ],
        ),
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
        return PostVideo(
          canBuildVideo: widget.canBuildVideo,
          videoListController: widget.videoListController,
          videoListData: VideoListData(widget.postModel),
        );
      case PostType.image:
        return PostImage(post: widget.postModel,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

enum PostType { video, image, text }
