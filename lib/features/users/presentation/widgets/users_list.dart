import 'package:blingpay_assesment/app_colors.dart';
import 'package:blingpay_assesment/features/users/data/bloc/user_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> with AutomaticKeepAliveClientMixin{
  UserCubit userCubit = UserCubit();

  @override
  void initState() {
    userCubit.fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<UserCubit, UserState>(
      bloc: userCubit,
      builder: (context, state) {
        if(state is FetchUsersLoading){
          return ListView.separated(
            shrinkWrap: true,
            itemCount: 20,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.2),
                      highlightColor: veryDarkBlue.withOpacity(0.1),
                    child: Container(
                      height: 50,
                      width:50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: shakeSpearBlue
                      ),
                    ),),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Shimmer.fromColors(
                                    baseColor: Colors.grey.withOpacity(0.2),
                                    highlightColor: veryDarkBlue.withOpacity(0.1),child: Container(height: 20,width: 120,color: shakeSpearBlue,)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Shimmer.fromColors(
                                    baseColor: Colors.grey.withOpacity(0.2),
                                    highlightColor: veryDarkBlue.withOpacity(0.1),child: Container(height: 20,width: 120,color: shakeSpearBlue,)),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Shimmer.fromColors(
                                baseColor: Colors.grey.withOpacity(0.2),
                                highlightColor: veryDarkBlue.withOpacity(0.1),child: Container(height: 30,color: shakeSpearBlue,)),
                          ],
                        ))
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 20,
              );
            },
          );
        }
        if(state is FetchUsersSuccess){
          return ListView.separated(
            shrinkWrap: true,
            itemCount: state.users.length,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Divider(color: Theme.of(context).colorScheme.outline,height: 0.3,),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: state.users[index].photo ?? '',
                          imageBuilder: (context, imageProvider) =>
                              Container(
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
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                value: downloadProgress.progress,
                                strokeWidth: 2,
                              ),
                          errorWidget: (context, url, error) => Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: paleBlue.withOpacity(0.3)
                              ),
                              child: const Icon(Icons.error)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                         Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      state.users[index].name ?? 'N/A',
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text('@${state.users[index].username ?? 'N/A'}'),
                                  ],
                                ),
                                Text(
                                  state.users[index].bio ?? '',
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 20,
              );
            },
          );
        }
        if(state is FetchUsersError){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.error),
              const SizedBox(height: 20,),
              MaterialButton(onPressed: (){
                userCubit.fetchUsers();
              },child: const Text('Retry'),)
            ],
          );
        }
       return const SizedBox.shrink();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
