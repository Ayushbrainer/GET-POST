import 'package:hive/hive.dart';
part 'PODO.g.dart';

class PostList {
  List<Post> posts;

  PostList({this.posts});

  factory PostList.fromJSON(List<dynamic> jsonMap) {
    List<Post> postlist = new List<Post>();
    postlist = jsonMap.map((e) => Post.fromJSON(e)).toList();
    return PostList(posts: postlist);
  }
}

@HiveType(typeId: 0)
class Post {
  @HiveField(0)
  int userId;
  @HiveField(1)
  int id;
  @HiveField(2)
  String title;
  @HiveField(3)
  String body;
  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
