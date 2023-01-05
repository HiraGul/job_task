part of 'instagram_posts_cubit.dart';

@immutable
abstract class InstagramPostsState extends Equatable {
  const InstagramPostsState();

  @override
  List<Object> get props => [];
}

class InstagramPostsInitial extends InstagramPostsState {
  @override
  List<Object> get props => [' Initial'];
}

class InstagramPostsLoading extends InstagramPostsState {
  @override
  List<Object> get props => ['Loading'];
}

class InstagramPostsLoaded extends InstagramPostsState {
  final List<String> posts;
  const InstagramPostsLoaded({required this.posts});
  @override
  List<Object> get props => ['Loaded'];
}

class InstagramPostsException extends InstagramPostsState {
  @override
  List<Object> get props => [' Exception'];
}
