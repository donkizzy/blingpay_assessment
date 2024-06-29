import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 20,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            CachedNetworkImage(
              imageUrl: "http://via.placeholder.com/350x150",
              imageBuilder: (context, imageProvider) => Container(
                height: 50,
                width: 50,
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
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              width: 20,
            ),
            const Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Alex Albon',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                    SizedBox(
                      width: 5,
                    ),
                    Text('@alexalbon'),
                  ],
                ),
                Text('Always curios to learn new stuff',style: TextStyle(fontWeight: FontWeight.w500),),
              ],
            ))
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 20,
        );
      },
    );
  }
}
