import 'package:blingpay_assesment/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostLoader extends StatelessWidget {
  const PostLoader({super.key});

  @override
  Widget build(BuildContext context) {
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
                  height: 35,
                  width: 35,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.2),
                              highlightColor: veryDarkBlue.withOpacity(0.1),child: Container(height: 20,width: 120,color: shakeSpearBlue,)),
                          const SizedBox(
                            width: 5,
                          ),
                          Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.2),
                              highlightColor: veryDarkBlue.withOpacity(0.1),child: Container(height: 20,width: 60,color: shakeSpearBlue,)),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.2),
                          highlightColor: veryDarkBlue.withOpacity(0.1),child: Container(height: 50,color: shakeSpearBlue,)),
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
}
