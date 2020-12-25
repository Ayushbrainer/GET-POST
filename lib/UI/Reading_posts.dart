import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:silent_hill_intern/UI/readingCard.dart';
import 'package:silent_hill_intern/json_code/Network.dart';
import 'package:silent_hill_intern/json_code/PODO.dart';

class reading_posts extends StatefulWidget {
  @override
  _reading_postsState createState() => _reading_postsState();
}

class _reading_postsState extends State<reading_posts> {
  Future<PostList> data;
  //Box<Post> posts;

  @override
  void initState() {
    // TODO: implement initState
    Network network = new Network("https://jsonplaceholder.typicode.com/posts");
    data = network.fetchData();
   // posts = Hive.box("posts");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot<PostList> snapshot) {
              List<Post> allPosts;
              if (snapshot.hasData) {
                allPosts = snapshot.data.posts;
                return ViewBuilder(allPosts, context);
              } else {
                // if(posts.isEmpty){
                //   return cacheBuilder(posts, context);
                // }else{
                  return Center(child: CircularProgressIndicator());
                //}
              }
            })
    );
  }
  Widget ViewBuilder(List<Post> data,BuildContext context){
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context,index){
        //posts.put(data[index].id,Post(id: data[index].id,title: data[index].title,userId: data[index].userId,body: data[index].body));
        return readCard(id: data[index].id,title: data[index].title,userId: data[index].userId,body: data[index].body,);
      },
    );
  }
}

// Widget cacheBuilder(Box<Post> posts,BuildContext context){
//   return ListView.builder(itemBuilder: (context,index){
//     return readCard(
//       id: posts.getAt(index).id,
//       userId: posts.getAt(index).userId,
//       title: posts.getAt(index).title,
//       body: posts.getAt(index).body,
//     );
//   },
//   itemCount: posts.keys.toList().length,);
// }