import 'package:blingpay_assesment/features/post/data/models/post_model.dart';

class VideoListData {
  final PostModel post;
  Duration? lastPosition;
  bool? wasPlaying = false;

  VideoListData(this.post);
}