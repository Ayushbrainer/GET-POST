import 'package:flutter/material.dart';

class detailedPost{
  int id,userId;
  String title,body;
  detailedPost({this.id,this.userId,this.title,this.body});

  Widget Page(){
      return Scaffold(
        appBar: AppBar(
          title: Text("User ID : $userId"),
          backgroundColor: Colors.deepPurple,
        ),

        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Flexible(child: Text("$title",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 37.0
                ),
                ),
                ),
              ),
              Container(
                child: Flexible(child: Text("$body",
                style: TextStyle(
                  fontSize: 30.0
                ),
                ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}