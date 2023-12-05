import '../../common_libs.dart';
import '../../model/posts/posts_response.dart';
import 'posts_cubit.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(),
      child: Scaffold(
        appBar: AppBar(

          title: const Text('Posts'),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            if(state is PostsLoaded){
              debugPrint('Hello${state.postsResponse.length}');
              return Center(
                child: ListView.builder(
                    itemCount: state.postsResponse.length??0,
                    itemBuilder: (context, index) {
                      debugPrint('Item=-=${state.postsResponse[index]}');
                      PostsItem(
                        posts: state.postsResponse[index]??PostsResponse(),
                      );
                    }),
              );

            }else{
              return Center(child: CircularProgressIndicator(color: Colors.deepPurple,));
            }
          },
        ),
      ),
    );
  }
}

class PostsItem extends StatelessWidget {
  final PostsResponse posts;

  const PostsItem({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 330,
      child: Column(
        children: [
          Text(
            posts.title.toString(),
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            posts.body.toString(),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Author Name:- ${posts.title.toString()}",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
