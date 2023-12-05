


import 'dart:convert';

import '../model/posts/posts_response.dart';
import 'package:http/http.dart' as http;

class PostsRepository {

  Future<List<PostsResponse>> getPostsResponse() async {


    final response = await http.get(Uri.parse(
        'https://brotherlike-navies.000webhostapp.com/people/people.php'));

    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => PostsResponse.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }


  }






}
