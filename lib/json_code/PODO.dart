class PostList{
  List<Post> posts;

  PostList({this.posts});

  factory PostList.fromJSON(List<dynamic> jsonMap){
    List<Post> postlist = new List<Post>();
    postlist = jsonMap.map((e) => Post.fromJSON(e)).toList();
    return PostList(posts: postlist);
  }

}


class Post{
  int userId;
  int id;
  String title;
  String body;
  Post({this.userId,this.id,this.title,this.body});

  factory Post.fromJSON(Map<String,dynamic> json){
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']
    );
  }
}
