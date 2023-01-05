part of 'instagram_stories_cubit_cubit.dart';

@immutable
abstract class InstagramStoriesCubitState {}

class InstagramStoriesCubitInitial extends InstagramStoriesCubitState {}

class InstagramStoriesLoading extends InstagramStoriesCubitState {}

class InstagramStoriesLoaded extends InstagramStoriesCubitState {
  final List<String> stories;
  InstagramStoriesLoaded({required this.stories});
}

class InstagramStoriesException extends InstagramStoriesCubitState {}
