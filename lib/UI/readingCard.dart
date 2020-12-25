import 'package:flutter/material.dart';
import 'package:silent_hill_intern/UI/detailCard.dart';

class readCard extends StatelessWidget {
  int id,userId;
  String title,body;
  readCard({this.id,this.userId,this.title,this.body});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(3.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //margin: EdgeInsets.only(left: 0.0,top: 20.0,right: 12.0,bottom: 10.0),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle
              ),
              child: Center(child: Text("$id"),),
            ),
            Container(

              child: Flexible(
                flex: 1,
                child: Center(child: Text(title),
              )
            ),
            )],
        ),
      ),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => detailedPost(id: id,userId: userId,title: title,body: body).Page()),
        );
      },
    );
  }
}
