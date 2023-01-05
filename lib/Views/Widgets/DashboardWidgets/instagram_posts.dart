import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/Cubits/InstaramPostsCubit/instagram_posts_cubit.dart';
import 'package:job_task/Utils/app_text_styles.dart';

class InstagramPosts extends StatelessWidget {
  const InstagramPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstagramPostsCubit, InstagramPostsState>(
        builder: (context, state) {
      if (state is InstagramPostsLoaded) {
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 20.sp),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.posts.length,
          itemBuilder: (ctx, i) {
            return Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.sp,
                      vertical: 10.sp,
                    ),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40.r),
                          child: Image(
                            image: NetworkImage(state.posts[i]),
                            width: 40.sp,
                            height: 40.sp,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text("John Doe",
                              style:
                                  AppTextStyles.instUserNameFontStyle(context)),
                        ),
                      ],
                    ),
                  ),
                  FadeInImage(
                    image: NetworkImage(state.posts[i]),
                    placeholder: const AssetImage("assets/placeholder.png"),
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            );
          },
        );
      }
      return Container();
    });
  }
}
