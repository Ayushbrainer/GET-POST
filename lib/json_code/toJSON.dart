
class Postsend{
  String title,body;

  Postsend({this.body,this.title});

  Map<String,dynamic> toJSON(){
    return {
      "title": title,
      "body": body
    };
  }
}
