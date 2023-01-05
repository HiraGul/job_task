import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_task/Cubits/InstaramPostsCubit/instagram_posts_cubit.dart';

void main() {
  group('Instagram posts and stories cubit test', () {
    late InstagramPostsCubit? usersCubit;

    setUp(() {
      EquatableConfig.stringify = true;

      usersCubit = InstagramPostsCubit();
    });

    tearDown(() {
      usersCubit!.close();
    });

    blocTest<InstagramPostsCubit, InstagramPostsState>(
        'The cubit should emit a userListLoading and UserListLoadedState([]) for successful Posts Loaded',
        build: () => usersCubit!,
        act: (cubit) => cubit.fetchInstagramPosts(),
        expect: () => [
              InstagramPostsLoading(),
              const InstagramPostsLoaded(posts: []),
            ]);
  });
}
