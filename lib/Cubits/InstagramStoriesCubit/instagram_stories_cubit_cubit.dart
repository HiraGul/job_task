import 'package:bloc/bloc.dart';
import 'package:job_task/Data/Repositories/InstagrampostStoriesRepo/insta_repo.dart';
import 'package:meta/meta.dart';

part 'instagram_stories_cubit_state.dart';

class InstagramStoriesCubitCubit extends Cubit<InstagramStoriesCubitState> {
  InstagramStoriesCubitCubit() : super(InstagramStoriesCubitInitial());
  fetchInstagramStories() {
    emit(InstagramStoriesLoading());
    try {
      final stories = InstagramStoriesPostRepostory.fetchInstagramStories();
      if (stories != null) {
        emit(InstagramStoriesLoaded(stories: stories));
      } else {
        emit(InstagramStoriesException());
      }
    } catch (e) {
      emit(InstagramStoriesException());
    }
  }
}
