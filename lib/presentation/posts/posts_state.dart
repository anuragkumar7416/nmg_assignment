part of 'posts_cubit.dart';

abstract class PostsState extends Equatable {
  final List<PostsResponse?> postsResponse;

  const PostsState(this.postsResponse);
}

class PostsInitial extends PostsState {
  const PostsInitial(super.postsResponse);



  @override
  List<Object> get props => [postsResponse];
}

class PostsLoading extends PostsState {
  const PostsLoading(super.postsResponse);

  @override
  List<Object?> get props => [postsResponse];
}

class PostsLoaded extends PostsState {
  const PostsLoaded(super.postsResponse);

  @override
  List<Object?> get props => [postsResponse];
}

class Error extends PostsState {
  const Error(super.postsResponse);

  @override
  List<Object?> get props => [postsResponse];
}
