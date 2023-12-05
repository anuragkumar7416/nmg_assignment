import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nmg_assignment/domain/posts_repository.dart';

import '../../model/posts/posts_response.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial([])){
    getPosts();
  }


  void getPosts() async{
    emit(PostsLoading(state.postsResponse));

    PostsRepository repository = PostsRepository();
    final List<PostsResponse> response = await repository.getPostsResponse();
    emit(PostsLoaded(response));

  }
}
