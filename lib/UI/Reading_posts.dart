import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:silent_hill_intern/UI/readingCard.dart';
import 'package:silent_hill_intern/json_code/Network.dart';
import 'package:silent_hill_intern/json_code/PODO.dart';

import '../main.dart';

class reading_posts extends StatefulWidget {
  @override
  _reading_postsState createState() => _reading_postsState();
}

class _reading_postsState extends State<reading_posts> {
  Future<PostList> data;

  @override
  void initState() {
    // TODO: implement initState
    Network network = new Network("https://jsonplaceholder.typicode.com/posts");
    data = network.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('posts'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
              backgroundColor: Colors.deepPurple,
              body: FutureBuilder(
                  future: data,
                  builder: (context, AsyncSnapshot<PostList> snapshot) {
                    if (snapshot.hasData) {
                      List<Post> allPosts = snapshot.data.posts;
                      return ViewBuilder(allPosts, context);
                    } else {
                      i++;
                      return CacheBuilder(context);
                    }
                  }));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget ViewBuilder(List<Post> data, BuildContext context) {
    // return Text(data.length.toString());
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        if (i != 0) {
          if (Hive.box('posts').getAt(index) != data[index]) {
            Hive.box('posts').add(data[index]);
          }
        } else {
          Hive.box('posts').add(data[index]);
        }
        return readCard(
          id: data[index].id,
          title: data[index].title,
          userId: data[index].userId,
          body: data[index].body,
        );
      },
    );
  }

  Widget CacheBuilder(BuildContext context) {
    final Posts = Hive.box('posts');
    return ListView.builder(
        itemCount: Posts.length,
        itemBuilder: (context, index) {
          print("Reading Cache");
          final Posts = Hive.box('posts');
          return readCard(
            id: Posts.getAt(index).id,
            title: Posts.getAt(index).title,
            userId: Posts.getAt(index).userId,
            body: Posts.getAt(index).body,
          );
        });
  }
}
