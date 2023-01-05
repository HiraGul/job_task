import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_task/Data/Repositories/InstagrampostStoriesRepo/insta_repo.dart';
import 'package:meta/meta.dart';

part 'instagram_posts_state.dart';

class InstagramPostsCubit extends Cubit<InstagramPostsState> {
  InstagramPostsCubit() : super(InstagramPostsInitial());
  fetchInstagramPosts() {
    try {
      emit(InstagramPostsLoading());
      final post = InstagramStoriesPostRepostory.fetchInstagramPosts();
      if (post != null) {
        emit(InstagramPostsLoaded(posts: post));
      } else {
        emit(InstagramPostsException());
      }
    } catch (e) {
      emit(InstagramPostsException());
    }
  }
}
