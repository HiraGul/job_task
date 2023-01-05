// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:job_task/Cubits/InstagramStoriesCubit/instagram_stories_cubit_cubit.dart';
import 'package:job_task/Cubits/InstaramPostsCubit/instagram_posts_cubit.dart';
import 'package:job_task/Utils/app_colors.dart';
import 'package:job_task/Views/Widgets/DashboardWidgets/instagram_posts.dart';
import 'package:job_task/Views/Widgets/DashboardWidgets/instagram_stories.dart';
import 'package:job_task/Views/Widgets/NoInternetWidget/no_internet.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late StreamSubscription subscription;
  bool? isDeviceConnected = true;
  @override
  @override
  void initState() {
    getConnectivity();
    BlocProvider.of<InstagramStoriesCubitCubit>(context)
        .fetchInstagramStories();
    BlocProvider.of<InstagramPostsCubit>(context).fetchInstagramPosts();
    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;

          setState(() {});
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: !isDeviceConnected!
          ? const NoInternetFoundWidget()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.sp,
                  ),
                  Container(
                    color: AppColors.whiteColor,
                    width: 1.sw,
                    margin: const EdgeInsets.symmetric(),
                    height: 120.sp,
                    child: BlocBuilder<InstagramStoriesCubitCubit,
                        InstagramStoriesCubitState>(
                      builder: (context, state) {
                        if (state is InstagramStoriesLoaded) {
                          // Instagram Stories Widget
                          return InstagramStories(
                            stories: state.stories,
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  // Instagram Posts Widget
                  const InstagramPosts()
                ],
              ),
            ),
    );
  }
}
