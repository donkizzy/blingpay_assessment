import 'package:blingpay_assesment/app_colors.dart';
import 'package:blingpay_assesment/features/post/data/bloc/posts_cubit.dart';
import 'package:blingpay_assesment/features/post/presentation/widgets/post_item.dart';
import 'package:blingpay_assesment/features/post/presentation/widgets/reuseable_video_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> with AutomaticKeepAliveClientMixin {
  ReusableVideoListController videoListController = ReusableVideoListController();

  PostsCubit postsCubit = PostsCubit();
  var value = 0;
  final ScrollController _scrollController = ScrollController();
  int lastMilli = DateTime.now().millisecondsSinceEpoch;
  bool _canBuildVideo = true;

  @override
  void initState() {
    postsCubit.fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<PostsCubit, PostsState>(
      bloc: postsCubit,
      builder: (context, state) {
        if(state is FetchPostsLoading){
          return const Center(child: CircularProgressIndicator(color: shakeSpearBlue,strokeWidth: 2,),);
        }
        if(state is FetchPostsSuccess){
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              final now = DateTime.now();
              final timeDiff = now.millisecondsSinceEpoch - lastMilli;
              if (notification is ScrollUpdateNotification) {
                final pixelsPerMilli = notification.scrollDelta! / timeDiff;
                if (pixelsPerMilli.abs() > 1) {
                  _canBuildVideo = false;
                } else {
                  _canBuildVideo = true;
                }
                lastMilli = DateTime.now().millisecondsSinceEpoch;
              }

              if (notification is ScrollEndNotification) {
                _canBuildVideo = true;
                lastMilli = DateTime.now().millisecondsSinceEpoch;
              }

              return true;
            },
            child: ListView.separated(
                itemCount: state.postModels.length,
                physics: const ClampingScrollPhysics(),
                controller: _scrollController,
                padding: const EdgeInsets.all(20),
                itemBuilder: (BuildContext context, int index) {
                  return PostItem(
                    postModel:state.postModels[index] ,
                    canBuildVideo:  _checkCanBuildVideo,
                    videoListController: videoListController,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                }
            ),
          );
        }
        if(state is FetchPostError){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.error,textAlign: TextAlign.center,),
              const SizedBox(height: 20,),
              MaterialButton(
                color: shakeSpearBlue,
                elevation: 0.0,
                onPressed: (){
                postsCubit.fetchPosts();
              },child: const Text('Retry',style: TextStyle(color: Colors.white),),)
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    videoListController.dispose();
    super.dispose();
  }

  bool _checkCanBuildVideo() {
    return _canBuildVideo;
  }
}
