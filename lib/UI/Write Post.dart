import 'package:flutter/material.dart';
import 'package:silent_hill_intern/json_code/Network.dart';
import 'package:silent_hill_intern/json_code/toJSON.dart';

class writePost extends StatefulWidget {
  @override
  _writePostState createState() => _writePostState();
}

class _writePostState extends State<writePost> {
  String title,body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Title of your post"),
          Container(
            child: Flexible(
              child: TextField(
                onChanged: (s){
                  setState(() {
                    title = s;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 40,),
          Text("What you want to write in it"),
          Container(
            child: Flexible(
              child: TextField(
                onChanged: (s){
                  setState(() {
                    body = s;
                  });
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15,30,15,15),
            // width: MediaQuery.of(context).size.width*0.12,
             height: MediaQuery.of(context).size.height*0.12,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: InkWell(
              child: Container(
                //margin: EdgeInsets.all(15),
                color: Colors.white,
                child: Center(child: Text("POST"),),
              ),
              onTap: () async{
               print(body+title);
               Network("https://jsonplaceholder.typicode.com/posts").postData(Postsend(title: title,body: body));
              },
            ),
          )
        ],
      )
    );
  }
}
